<!DOCTYPE html>
<html>
<head>
    <title>Daftar Produk</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="container mt-5">

@if(session('success'))
<div class="alert alert-success">
    {{ session('success') }}
</div>
@endif

<div class="d-flex justify-content-between mb-3">
    <h3>Daftar Produk</h3>

    <a href="{{ route('products.create') }}" class="btn btn-primary">
        Tambah
    </a>
</div>

<table class="table table-bordered">

    <tr>
        <th>Nama</th>
        <th>Harga</th>
        <th>Variant</th>
        <th>Aksi</th>
    </tr>

    @foreach($products as $product)

    <tr>

        <td>
            {{ $product->name }}
        </td>

        <td>
            {{ $product->price }}
        </td>

        <td>
            <ul>

                @foreach($product->variants as $var)

                <li>
                    <b>{{ $var->name }}</b> <br>

                    Desc :
                    {{ $var->description }}
                    <br>

                    Processor :
                    {{ $var->processor }}
                    <br>

                    RAM :
                    {{ $var->memory }}
                    <br>

                    Storage :
                    {{ $var->storage }}
                    <br>

                    Product :
                    {{ $var->product->name }}
                </li>

                <hr>

                @endforeach

            </ul>
        </td>

        <td>

            <a href="{{ route('products.edit', $product->id) }}"
                class="btn btn-warning btn-sm">

                Edit

            </a>

            <form action="{{ route('products.destroy', $product->id) }}"
                method="POST"
                style="display:inline">

                @csrf
                @method('DELETE')

                <button class="btn btn-danger btn-sm">
                    Hapus
                </button>

            </form>

        </td>

    </tr>

    @endforeach

</table>

</body>
</html>
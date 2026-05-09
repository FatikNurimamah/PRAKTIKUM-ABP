<!DOCTYPE html>
<html>
<head>
    <title>Form Produk</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h3>Form {{ $title }} Produk</h3>

<form action="{{ $route }}" method="POST">
    @csrf

    @if($method == 'PUT')
        @method('PUT')
    @endif

    <div class="mb-3">
        <label>Nama</label>
        <input type="text" name="name"
            value="{{ old('name', $product->name) }}"
            class="form-control">

        @error('name')
            <small class="text-danger">{{ $message }}</small>
        @enderror
    </div>

    <div class="mb-3">
        <label>Harga</label>
        <input type="number" name="price"
            value="{{ old('price', $product->price) }}"
            class="form-control">

        @error('price')
            <small class="text-danger">{{ $message }}</small>
        @enderror
    </div>

    <button class="btn btn-success">
        Simpan
    </button>

</form>

</body>
</html>
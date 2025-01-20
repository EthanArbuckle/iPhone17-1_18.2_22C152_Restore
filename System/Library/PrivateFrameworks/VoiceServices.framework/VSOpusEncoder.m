@interface VSOpusEncoder
- (AVAudioCompressedBuffer)outputBuffer;
- (AVAudioConverter)converter;
- (AVAudioFormat)fromFormat;
- (AVAudioFormat)toFormat;
- (VSOpusEncoder)initWithSourceASBD:(AudioStreamBasicDescription *)a3;
- (id)errorHandler;
- (id)opusDataHandler;
- (int64_t)opusDataOffset;
- (void)beginEncoding;
- (void)encodeChunk:(id)a3;
- (void)endEncoding;
- (void)setConverter:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFromFormat:(id)a3;
- (void)setOpusDataHandler:(id)a3;
- (void)setOpusDataOffset:(int64_t)a3;
- (void)setOutputBuffer:(id)a3;
- (void)setToFormat:(id)a3;
@end

@implementation VSOpusEncoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBuffer, 0);
  objc_storeStrong((id *)&self->_converter, 0);
  objc_storeStrong((id *)&self->_toFormat, 0);
  objc_storeStrong((id *)&self->_fromFormat, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_opusDataHandler, 0);
}

- (void)setOpusDataOffset:(int64_t)a3
{
  self->_opusDataOffset = a3;
}

- (int64_t)opusDataOffset
{
  return self->_opusDataOffset;
}

- (void)setOutputBuffer:(id)a3
{
}

- (AVAudioCompressedBuffer)outputBuffer
{
  return self->_outputBuffer;
}

- (void)setConverter:(id)a3
{
}

- (AVAudioConverter)converter
{
  return self->_converter;
}

- (void)setToFormat:(id)a3
{
}

- (AVAudioFormat)toFormat
{
  return self->_toFormat;
}

- (void)setFromFormat:(id)a3
{
}

- (AVAudioFormat)fromFormat
{
  return self->_fromFormat;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (id)opusDataHandler
{
  return self->_opusDataHandler;
}

- (void)endEncoding
{
  [(VSOpusEncoder *)self encodeChunk:0];
  converter = self->_converter;
  [(AVAudioConverter *)converter reset];
}

- (void)encodeChunk:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 length];
  uint64_t v6 = v5 / [(AVAudioFormat *)self->_fromFormat streamDescription][24];
  v19 = [MEMORY[0x263EFF990] data];
  v7 = [MEMORY[0x263EFF990] data];
  uint64_t v21 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  int v29 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  do
  {
    converter = self->_converter;
    outputBuffer = self->_outputBuffer;
    id v27 = 0;
    v23[0] = v20;
    v23[1] = 3221225472;
    v23[2] = __29__VSOpusEncoder_encodeChunk___block_invoke;
    v23[3] = &unk_2640E8400;
    int v26 = v6;
    v25 = v28;
    v23[4] = self;
    id v10 = v4;
    id v24 = v10;
    unint64_t v11 = [(AVAudioConverter *)converter convertToBuffer:outputBuffer error:&v27 withInputFromBlock:v23];
    id v12 = v27;
    if (v11 <= 1)
    {
      objc_msgSend(v19, "appendBytes:length:", *(void *)(-[AVAudioCompressedBuffer audioBufferList](self->_outputBuffer, "audioBufferList") + 16), *(unsigned int *)(-[AVAudioCompressedBuffer audioBufferList](self->_outputBuffer, "audioBufferList") + 12));
      uint64_t v13 = v6;
      id v14 = v4;
      uint64_t v15 = 0;
      unint64_t v16 = 0;
      long long v22 = 0uLL;
      while (v16 < [(AVAudioCompressedBuffer *)self->_outputBuffer packetCount])
      {
        long long v22 = (__int128)[(AVAudioCompressedBuffer *)self->_outputBuffer packetDescriptions][v15];
        *(void *)&long long v22 = v22 + self->_opusDataOffset;
        [v7 appendBytes:&v22 length:16];
        ++v16;
        v15 += 16;
      }
      self->_opusDataOffset = v22 + HIDWORD(v22);
      v21 += [(AVAudioCompressedBuffer *)self->_outputBuffer packetCount];
      id v4 = v14;
      uint64_t v6 = v13;
    }
  }
  while (!v11 && !v12);
  if (v12)
  {
    errorHandler = (void (**)(id, id))self->_errorHandler;
    if (errorHandler) {
      errorHandler[2](errorHandler, v12);
    }
  }
  else
  {
    opusDataHandler = (void (**)(id, void *, void, void *))self->_opusDataHandler;
    if (opusDataHandler) {
      opusDataHandler[2](opusDataHandler, v19, v21, v7);
    }
  }

  _Block_object_dispose(v28, 8);
}

id __29__VSOpusEncoder_encodeChunk___block_invoke(uint64_t a1, int a2, uint64_t *a3)
{
  if (*(_DWORD *)(a1 + 56))
  {
    int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    unint64_t v7 = (*(_DWORD *)([*(id *)(*(void *)(a1 + 32) + 24) streamDescription] + 24) * v6);
    if ([*(id *)(a1 + 40) length] > v7)
    {
      unsigned int v8 = *(_DWORD *)([*(id *)(*(void *)(a1 + 32) + 32) streamDescription] + 20) * a2;
      unsigned int v9 = *(_DWORD *)(a1 + 56) - *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (v8 >= v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v8;
      }
      unint64_t v11 = (void *)[objc_alloc(MEMORY[0x263EF93B0]) initWithPCMFormat:*(void *)(*(void *)(a1 + 32) + 24) frameCapacity:v10];
      [v11 setFrameLength:v10];
      LODWORD(v12) = *(_DWORD *)([*(id *)(*(void *)(a1 + 32) + 24) streamDescription] + 24) * v10;
      unsigned int v13 = [*(id *)(a1 + 40) length] - v7;
      if (v12 >= v13) {
        size_t v12 = v13;
      }
      else {
        size_t v12 = v12;
      }
      memcpy(*(void **)([v11 mutableAudioBufferList] + 16), (const void *)(objc_msgSend(*(id *)(a1 + 40), "bytes") + v7), v12);
      *(_DWORD *)([v11 mutableAudioBufferList] + 12) = v12;
      *a3 = 0;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v10;
      goto LABEL_13;
    }
    unint64_t v11 = 0;
    uint64_t v14 = 1;
  }
  else
  {
    unint64_t v11 = 0;
    uint64_t v14 = 2;
  }
  *a3 = v14;
LABEL_13:
  return v11;
}

- (void)beginEncoding
{
  self->_opusDataOffset = 0;
}

- (void)setErrorHandler:(id)a3
{
  id v4 = (void *)MEMORY[0x210554730](a3, a2);
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = v4;
}

- (void)setOpusDataHandler:(id)a3
{
  id v4 = (void *)MEMORY[0x210554730](a3, a2);
  id opusDataHandler = self->_opusDataHandler;
  self->_id opusDataHandler = v4;
}

- (VSOpusEncoder)initWithSourceASBD:(AudioStreamBasicDescription *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)VSOpusEncoder;
  id v4 = [(VSOpusEncoder *)&v21 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263EF9388]) initWithStreamDescription:a3];
    fromFormat = v4->_fromFormat;
    v4->_fromFormat = (AVAudioFormat *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263EF9388]) initWithStreamDescription:&VSAudioFormat48khzOpus];
    toFormat = v4->_toFormat;
    v4->_toFormat = (AVAudioFormat *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263EF9340]) initFromFormat:v4->_fromFormat toFormat:v4->_toFormat];
    converter = v4->_converter;
    v4->_converter = (AVAudioConverter *)v9;

    if (![(AVAudioConverter *)v4->_converter maximumOutputPacketSize])
    {
      unint64_t v11 = VSGetLogDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = v4->_converter;
        *(_DWORD *)buf = 138412290;
        v23 = v20;
        _os_log_error_impl(&dword_20CABC000, v11, OS_LOG_TYPE_ERROR, "converter.maximumOutputPacketSize is 0. Falling back to maximumPacketSize 1024. Converter is %@", buf, 0xCu);
      }

      size_t v12 = VSGetLogDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_20CABC000, v12, OS_LOG_TYPE_FAULT, "AVAudioConverter.maximumOutputPacketSize is 0.", buf, 2u);
      }
    }
    id v13 = objc_alloc(MEMORY[0x263EF9330]);
    uint64_t v14 = v4->_toFormat;
    uint64_t v15 = [(AVAudioConverter *)v4->_converter maximumOutputPacketSize];
    if (v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 1024;
    }
    uint64_t v17 = [v13 initWithFormat:v14 packetCapacity:50 maximumPacketSize:v16];
    outputBuffer = v4->_outputBuffer;
    v4->_outputBuffer = (AVAudioCompressedBuffer *)v17;
  }
  return v4;
}

@end
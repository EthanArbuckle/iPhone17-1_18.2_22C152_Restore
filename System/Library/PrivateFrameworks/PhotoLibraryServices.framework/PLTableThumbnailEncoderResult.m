@interface PLTableThumbnailEncoderResult
+ (unint64_t)_minKtxDataLengthFromImageSize:(CGSize)a3;
- (NSData)imageData;
- (NSData)ktxData;
- (NSData)ktxHeaderData;
- (NSString)uuid;
- (PLImageFormat)imageFormat;
- (PLImageTableEntryFooter_s)tableFooter;
- (PLTableThumbnailEncoderResult)initWithKtxData:(id)a3 uuid:(id)a4 format:(id)a5;
- (PL_KTXHeader)_ktxHeader;
- (id)entryDataForEntryLength:(unint64_t)a3;
- (unint64_t)imageDataLength;
- (void)setUuid:(id)a3;
@end

@implementation PLTableThumbnailEncoderResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_imageFormat, 0);
  objc_storeStrong((id *)&self->_ktxData, 0);
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (PLImageFormat)imageFormat
{
  return self->_imageFormat;
}

- (NSData)ktxData
{
  return self->_ktxData;
}

- (id)entryDataForEntryLength:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = [(PLTableThumbnailEncoderResult *)self imageData];
  unint64_t v6 = [v5 length] + 28;

  if (v6 <= a3)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:a3];
    v9 = [(PLTableThumbnailEncoderResult *)self imageData];
    uint64_t v10 = [v9 length];
    id v11 = [(PLTableThumbnailEncoderResult *)self imageData];
    objc_msgSend(v8, "replaceBytesInRange:withBytes:", 0, v10, objc_msgSend(v11, "bytes"));

    LODWORD(v15) = 0;
    [(PLTableThumbnailEncoderResult *)self tableFooter];
    objc_msgSend(v8, "replaceBytesInRange:withBytes:", objc_msgSend(v8, "length") - 28, 28, &v13);
  }
  else
  {
    v7 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 134217984;
      unint64_t v14 = a3;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Cannot build entry data, entryLength: %ld too small", (uint8_t *)&v13, 0xCu);
    }

    v8 = 0;
  }
  return v8;
}

- (PLImageTableEntryFooter_s)tableFooter
{
  v5 = [(PLTableThumbnailEncoderResult *)self _ktxHeader];
  *(void *)&retstr->var0.var8 = 0;
  *(void *)&retstr->var1 = 0;
  *(void *)&retstr->var0.var0 = 0;
  retstr->var3 = 0;
  unint64_t v6 = [(PLTableThumbnailEncoderResult *)self uuid];
  *(void *)&retstr->var0.var0 = PLUUIDBytesFromString();
  *(void *)&retstr->var0.var8 = v7;

  if (v5) {
    uint64_t v9 = *(void *)&v5->var7;
  }
  else {
    uint64_t v9 = 0;
  }
  *(void *)&retstr->var1 = v9;
  retstr->var3 = 0;
  return result;
}

- (NSData)imageData
{
  unint64_t v3 = [(PLTableThumbnailEncoderResult *)self imageDataLength];
  v4 = [(PLTableThumbnailEncoderResult *)self ktxData];
  unint64_t v5 = [v4 length] - v3;

  unint64_t v6 = [(PLTableThumbnailEncoderResult *)self ktxData];
  uint64_t v7 = objc_msgSend(v6, "subdataWithRange:", v5, v3);

  return (NSData *)v7;
}

- (unint64_t)imageDataLength
{
  unint64_t v3 = [(PLTableThumbnailEncoderResult *)self _ktxHeader];
  id v4 = [(PLTableThumbnailEncoderResult *)self ktxData];
  unint64_t v5 = *(unsigned int *)([v4 bytes] + v3->var13 + 64);

  return v5;
}

- (NSData)ktxHeaderData
{
  v2 = [(PLTableThumbnailEncoderResult *)self ktxData];
  unint64_t v3 = objc_msgSend(v2, "subdataWithRange:", 0, 64);

  return (NSData *)v3;
}

- (PLTableThumbnailEncoderResult)initWithKtxData:(id)a3 uuid:(id)a4 format:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLTableThumbnailEncoderResult;
  v12 = [(PLTableThumbnailEncoderResult *)&v15 init];
  int v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a4);
    objc_storeStrong((id *)&v13->_ktxData, a3);
    objc_storeStrong((id *)&v13->_imageFormat, a5);
  }

  return v13;
}

- (PL_KTXHeader)_ktxHeader
{
  id v2 = [(PLTableThumbnailEncoderResult *)self ktxData];
  unint64_t v3 = (PL_KTXHeader *)[v2 bytes];

  return v3;
}

+ (unint64_t)_minKtxDataLengthFromImageSize:(CGSize)a3
{
  return (unint64_t)(a3.width * a3.height + 68.0);
}

@end
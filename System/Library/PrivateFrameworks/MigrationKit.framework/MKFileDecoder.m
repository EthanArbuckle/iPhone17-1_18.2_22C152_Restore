@interface MKFileDecoder
- (id)extractFormatOfAsset:(id)a3;
@end

@implementation MKFileDecoder

- (id)extractFormatOfAsset:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = [NSURL fileURLWithPath:v3];
    if (v4)
    {
      v5 = (void *)v4;
      id v14 = 0;
      v6 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v4 error:&v14];
      id v7 = v14;
      if (!v7)
      {
        unint64_t v8 = +[MKSignature preferredSignatureLength];
        id v13 = 0;
        v9 = [v6 readDataUpToLength:v8 error:&v13];
        id v10 = v13;
        if (!v10)
        {
          if ([v9 length] == v8)
          {
            +[MKSignature identifier:length:](MKSignature, "identifier:length:", [v9 bytes], v8);
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = &stru_26DF6A8B0;
          }

LABEL_9:
          goto LABEL_11;
        }
        id v7 = v10;
      }
      v6 = +[MKLog log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(MKFileDecoder *)(uint64_t)v3 extractFormatOfAsset:v6];
      }
      v11 = &stru_26DF6A8B0;
      v5 = v7;
      goto LABEL_9;
    }
  }
  v11 = &stru_26DF6A8B0;
LABEL_11:

  return v11;
}

- (void)extractFormatOfAsset:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_22BFAC000, a3, OS_LOG_TYPE_ERROR, "could not extract a format of asset. path=%@, error=%@", (uint8_t *)&v6, 0x16u);
}

@end
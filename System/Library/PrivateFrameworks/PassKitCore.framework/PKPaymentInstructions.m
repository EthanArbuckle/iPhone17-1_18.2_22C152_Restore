@interface PKPaymentInstructions
- (BOOL)archiveToDirectoryAtURL:(id)a3 error:(id *)a4;
- (CGDataProvider)_createImageDataProviderForImageKey:(id)a3;
- (CGImage)imageForKey:(id)a3;
- (NSArray)allImageKeys;
- (NSData)fortifiedInstructionsData;
- (NSData)fortifiedSignatureData;
- (NSData)instructionsData;
- (NSData)signatureData;
- (NSDictionary)instructionsDictionary;
- (PKPaymentInstructions)initWithDictionary:(id)a3;
- (id)_imageDataForImageWithKey:(id)a3 format:(id *)a4;
- (id)description;
- (int64_t)version;
- (void)_pruneDirectoryAtURL:(id)a3;
- (void)setFortifiedInstructionsData:(id)a3;
- (void)setFortifiedSignatureData:(id)a3;
- (void)setInstructionsData:(id)a3;
- (void)setInstructionsDictionary:(id)a3;
- (void)setSignatureData:(id)a3;
@end

@implementation PKPaymentInstructions

- (PKPaymentInstructions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"version"];
  int64_t v6 = [v5 integerValue];

  v7 = [v4 objectForKey:@"instructions"];
  v8 = objc_msgSend(v7, "pk_decodeHexadecimal");

  v9 = [v4 objectForKey:@"signature"];
  v10 = objc_msgSend(v9, "pk_decodeHexadecimal");

  v11 = [v4 objectForKey:@"fortifiedInstructions"];
  v12 = objc_msgSend(v11, "pk_decodeHexadecimal");

  v13 = [v4 objectForKey:@"fortifiedSignature"];

  v14 = objc_msgSend(v13, "pk_decodeHexadecimal");

  v15 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:0];
  objc_opt_class();
  int v16 = objc_opt_isKindOfClass() & (v8 != 0);
  if (!v10) {
    int v16 = 0;
  }
  if (v16 != 1 || v6 != 2)
  {
    if (!v16) {
      goto LABEL_10;
    }
LABEL_9:
    self->_version = v6;
    objc_storeStrong((id *)&self->_instructionsDictionary, v15);
    objc_storeStrong((id *)&self->_instructionsData, v8);
    objc_storeStrong((id *)&self->_signatureData, v10);
    objc_storeStrong((id *)&self->_fortifiedInstructionsData, v12);
    objc_storeStrong((id *)&self->_fortifiedSignatureData, v14);
    goto LABEL_10;
  }
  if (v12 && v14) {
    goto LABEL_9;
  }
LABEL_10:

  return self;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; version: %d; instructions: %tu bytes; signature: %tu bytes; ",
    v5,
    self,
    self->_version,
    [(NSData *)self->_instructionsData length],
  int64_t v6 = [(NSData *)self->_signatureData length]);

  if (self->_version == 2) {
    objc_msgSend(v6, "appendFormat:", @"fortifiedInstructions: %tu bytes; fortifiedSignature: %tu bytes; ",
  }
      [(NSData *)self->_fortifiedInstructionsData length],
      [(NSData *)self->_fortifiedSignatureData length]);
  v7 = [(PKPaymentInstructions *)self allImageKeys];
  objc_msgSend(v6, "appendFormat:", @"%tu images: { ", objc_msgSend(v7, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v14 = [(PKPaymentInstructions *)self _imageDataForImageWithKey:v13 format:0];
        [v6 appendFormat:@"%@: %tu bytes, ", v13, objc_msgSend(v14, "length")];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  [v6 appendString:@"}; >"];
  v15 = (void *)[v6 copy];

  return v15;
}

- (NSArray)allImageKeys
{
  v2 = [(NSDictionary *)self->_instructionsDictionary objectForKey:@"images"];
  v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (CGImage)imageForKey:(id)a3
{
  result = [(PKPaymentInstructions *)self _createImageDataProviderForImageKey:a3];
  if (result)
  {
    id v4 = result;
    v5 = CGImageCreateWithPNGDataProvider(result, 0, 0, kCGRenderingIntentDefault);
    CFRelease(v4);
    return v5;
  }
  return result;
}

- (BOOL)archiveToDirectoryAtURL:(id)a3 error:(id *)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = NSString;
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceReferenceDate];
  uint64_t v10 = objc_msgSend(v7, "stringWithFormat:", @"DFR_%ld", llround(v9));
  uint64_t v11 = [v6 URLByAppendingPathComponent:v10];

  v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v13 = [v11 path];
  char v14 = [v12 fileExistsAtPath:v13];

  if (v14)
  {
    id v15 = 0;
  }
  else
  {
    int v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v58 = 0;
    int v17 = [v16 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v58];
    id v15 = v58;

    if (!v17)
    {
      BOOL v43 = 0;
      if (!a4) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  id v57 = v15;
  long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:v11 options:1 error:&v57];
  id v19 = v57;

  if (v18)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v21 = objc_msgSend(NSNumber, "numberWithInteger:", -[PKPaymentInstructions version](self, "version"));
    [v20 setObject:v21 forKeyedSubscript:@"version"];

    uint64_t v22 = [(PKPaymentInstructions *)self instructionsData];
    [v20 setObject:v22 forKeyedSubscript:@"instructions"];

    v23 = [(PKPaymentInstructions *)self signatureData];
    [v20 setObject:v23 forKeyedSubscript:@"signature"];

    v24 = [(PKPaymentInstructions *)self fortifiedInstructionsData];
    [v20 setObject:v24 forKeyedSubscript:@"fortifiedInstructions"];

    v25 = [(PKPaymentInstructions *)self fortifiedSignatureData];
    [v20 setObject:v25 forKeyedSubscript:@"fortifiedSignature"];

    id v56 = 0;
    v26 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v20 format:100 options:0 error:&v56];
    id v27 = v56;

    if (v26)
    {
      v45 = v26;
      id v46 = v20;
      v47 = v11;
      v48 = a4;
      id v49 = v6;
      id v28 = (id)[v18 addRegularFileWithContents:v26 preferredFilename:@"Instructions.plist"];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v29 = [(PKPaymentInstructions *)self allImageKeys];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v52 objects:v63 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v53 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v52 + 1) + 8 * i);
            id v51 = 0;
            v35 = [(PKPaymentInstructions *)self _imageDataForImageWithKey:v34 format:&v51];
            id v36 = v51;
            v37 = [NSString stringWithFormat:@"%@.%@", v34, v36];
            id v38 = (id)[v18 addRegularFileWithContents:v35 preferredFilename:v37];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v52 objects:v63 count:16];
        }
        while (v31);
      }

      id v50 = v27;
      uint64_t v11 = v47;
      int v39 = [v18 writeToURL:v47 options:1 originalContentsURL:0 error:&v50];
      id v19 = v50;

      if (v39)
      {
        v40 = PKLogFacilityTypeGetObject(7uLL);
        a4 = v48;
        id v6 = v49;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (objc_class *)objc_opt_class();
          v42 = NSStringFromClass(v41);
          *(_DWORD *)buf = 138543618;
          v60 = v42;
          __int16 v61 = 2112;
          v62 = v47;
          _os_log_impl(&dword_190E10000, v40, OS_LOG_TYPE_DEFAULT, "Archived latest %{public}@ at %@", buf, 0x16u);
        }
        BOOL v43 = 1;
      }
      else
      {
        BOOL v43 = 0;
        a4 = v48;
        id v6 = v49;
      }
      v26 = v45;
      id v20 = v46;
    }
    else
    {
      BOOL v43 = 0;
      id v19 = v27;
    }
    [(PKPaymentInstructions *)self _pruneDirectoryAtURL:v6];
  }
  else
  {
    BOOL v43 = 0;
  }

  id v15 = v19;
  if (a4) {
LABEL_25:
  }
    *a4 = v15;
LABEL_26:

  return v43;
}

- (void)_pruneDirectoryAtURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v3 path];
  id v6 = [v4 contentsOfDirectoryAtPath:v5 error:0];

  unint64_t v7 = [v6 count];
  if (v7 >= 0xB)
  {
    unint64_t v8 = v7;
    long long v18 = v6;
    double v9 = [v6 sortedArrayUsingSelector:sel_compare_];
    uint64_t v10 = 0;
    unint64_t v11 = v8 - 10;
    do
    {
      v12 = [v9 objectAtIndex:v10];
      uint64_t v13 = [v3 URLByAppendingPathComponent:v12];
      char v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v14 removeItemAtURL:v13 error:0];

      id v15 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = (objc_class *)objc_opt_class();
        int v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 138543618;
        id v20 = v17;
        __int16 v21 = 2112;
        uint64_t v22 = v13;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Deleted excess %{public}@ at %@", buf, 0x16u);
      }
      ++v10;
    }
    while (v11 != v10);

    id v6 = v18;
  }
}

- (CGDataProvider)_createImageDataProviderForImageKey:(id)a3
{
  id v7 = 0;
  CFDataRef v3 = [(PKPaymentInstructions *)self _imageDataForImageWithKey:a3 format:&v7];
  id v4 = v7;
  objc_opt_class();
  v5 = 0;
  if (objc_opt_isKindOfClass())
  {
    if ([v4 caseInsensitiveCompare:@"PNG"]) {
      v5 = 0;
    }
    else {
      v5 = CGDataProviderCreateWithCFData(v3);
    }
  }

  return v5;
}

- (id)_imageDataForImageWithKey:(id)a3 format:(id *)a4
{
  instructionsDictionary = self->_instructionsDictionary;
  id v6 = a3;
  id v7 = [(NSDictionary *)instructionsDictionary objectForKey:@"images"];
  unint64_t v8 = [v7 objectForKey:v6];

  if (a4)
  {
    *a4 = [v8 objectForKey:@"format"];
  }
  double v9 = [v8 objectForKey:@"content"];

  return v9;
}

- (int64_t)version
{
  return self->_version;
}

- (NSData)instructionsData
{
  return self->_instructionsData;
}

- (void)setInstructionsData:(id)a3
{
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (void)setSignatureData:(id)a3
{
}

- (NSData)fortifiedInstructionsData
{
  return self->_fortifiedInstructionsData;
}

- (void)setFortifiedInstructionsData:(id)a3
{
}

- (NSData)fortifiedSignatureData
{
  return self->_fortifiedSignatureData;
}

- (void)setFortifiedSignatureData:(id)a3
{
}

- (NSDictionary)instructionsDictionary
{
  return self->_instructionsDictionary;
}

- (void)setInstructionsDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionsDictionary, 0);
  objc_storeStrong((id *)&self->_fortifiedSignatureData, 0);
  objc_storeStrong((id *)&self->_fortifiedInstructionsData, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_instructionsData, 0);
}

@end
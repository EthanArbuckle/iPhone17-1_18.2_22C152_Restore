@interface MSCMSContentInfo
+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5;
- (MSCMSContentInfo)initWithDataContent:(id)a3;
- (MSCMSContentInfo)initWithEmbeddedContent:(id)a3;
- (MSCMSMessage)embeddedContent;
- (MSOID)contentType;
- (NSData)content;
- (id)encodeMessageSecurityObject:(id *)a3;
- (void)setContent:(id)a3;
- (void)setContentType:(id)a3;
- (void)setEmbeddedContent:(id)a3;
@end

@implementation MSCMSContentInfo

- (MSCMSMessage)embeddedContent
{
  return (MSCMSMessage *)objc_getProperty(self, a2, 16, 1);
}

- (MSOID)contentType
{
  return (MSOID *)objc_getProperty(self, a2, 24, 1);
}

+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5 && *a5) {
    v9 = (void *)[*a5 copy];
  }
  else {
    v9 = 0;
  }
  v26[0] = 0;
  v26[1] = 0;
  v27 = 0;
  int v10 = nsheim_decode_ContentInfo(v7);
  if (v10)
  {
    v11 = MSErrorASN1Domain[0];
    uint64_t v12 = v10;
    if (v7) {
      uint64_t v13 = [v7 length];
    }
    else {
      uint64_t v13 = -1;
    }
    id v18 = +[MSError MSErrorWithDomain:v11, v12, v9, @"unable to decode content info (%ld bytes)", v13 code underlyingError description];

    dumpNSData("ContentInfo", v7);
    v19 = 0;
    v14 = 0;
    v16 = 0;
LABEL_14:
    v20 = 0;
    if (!a5) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  id v25 = v9;
  v14 = +[MSOID OIDWithAsn1OID:v26 error:&v25];
  id v15 = v25;

  v16 = NSDataFromAny(v27);
  if (v16)
  {
    if ([v14 isEqualToString:@"1.2.840.113549.1.7.1"])
    {
      int v17 = nsheim_decode_DataContent(v16);
      if (v17)
      {
        +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], v17, v15, @"unable to decode data content (%ld bytes)", [v16 length]);
        id v18 = (id)objc_claimAutoreleasedReturnValue();

        dumpNSData("DataContent", v16);
        v19 = 0;
        goto LABEL_14;
      }
      uint64_t v21 = [MEMORY[0x263EFF8F8] dataWithBytes:0 length:0];

      free_DataContent();
      v20 = 0;
      v16 = (void *)v21;
    }
    else
    {
      id v24 = v15;
      v20 = decodeEmbeddedCMSContent(v14, v16, v8, (uint64_t)&v24);
      id v18 = v24;

      if (!v20)
      {
        v19 = 0;
        if (!a5) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
      id v15 = v18;
    }
  }
  else
  {
    v20 = 0;
  }
  v19 = [MSCMSContentInfo alloc];
  [(MSCMSContentInfo *)v19 setContentType:v14];
  [(MSCMSContentInfo *)v19 setContent:v16];
  if (v20) {
    [(MSCMSContentInfo *)v19 setEmbeddedContent:v20];
  }
  id v18 = v15;
  if (a5)
  {
LABEL_23:
    if (v18) {
      *a5 = v18;
    }
  }
LABEL_25:
  free_ContentInfo();
  v22 = v19;

  return v22;
}

- (void)setEmbeddedContent:(id)a3
{
}

- (void)setContentType:(id)a3
{
}

- (void)setContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_embeddedContent, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  v45[1] = *MEMORY[0x263EF8340];
  if (a3 && *a3) {
    v5 = (void *)[*a3 copy];
  }
  else {
    v5 = 0;
  }
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  v41 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  contentType = self->_contentType;
  if (!contentType) {
    goto LABEL_38;
  }
  embeddedContent = self->_embeddedContent;
  p_content = &self->_content;
  if (!self->_content)
  {
    if (embeddedContent)
    {
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      v41 = &v37;
LABEL_14:
      id v36 = v5;
      id v15 = [(MSCMSMessage *)embeddedContent encodeMessageSecurityObject:&v36];
      id v16 = v36;

      if (v15)
      {
        objc_storeStrong((id *)&self->_content, v15);
        goto LABEL_25;
      }
      goto LABEL_39;
    }
LABEL_38:
    id v16 = +[MSError MSErrorWithDomain:MSErrorCMSDomain[0] code:-50 underlyingError:v5 description:@"Unable to encode content info: missing content type or content"];

LABEL_39:
    id v23 = 0;
    goto LABEL_40;
  }
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  v41 = &v37;
  if (embeddedContent) {
    goto LABEL_14;
  }
  if ([(MSOID *)contentType isEqualToString:@"1.2.840.113549.1.7.1"])
  {
    v35[0] = [(NSData *)*p_content length];
    v35[1] = [(NSData *)*p_content bytes];
    uint64_t v34 = 0;
    uint64_t v9 = length_DataContent((uint64_t)v35);
    int v10 = [MEMORY[0x263EFF990] dataWithLength:v9];
    if (v10)
    {
      id v11 = v10;
      int v12 = encode_DataContent([v11 mutableBytes] + v9 - 1, v9, (uint64_t)v35, (uint64_t)&v34);
      if (!v12)
      {
        if (v9 != v34) {
          goto LABEL_43;
        }
        goto LABEL_22;
      }
      int v13 = v12;

      uint64_t v14 = v13;
    }
    else
    {
      uint64_t v14 = 12;
    }
    if (a3)
    {
      int v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F08320];
      v45[0] = @"Failed encoding type DataContent";
      id v18 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
      *a3 = [v17 errorWithDomain:@"com.apple.HeimASN1" code:v14 userInfo:v18];
    }
    id v11 = 0;
LABEL_22:
    if (objc_msgSend(v11, "length", v34))
    {
      id v15 = [MEMORY[0x263EFF8F8] dataWithData:v11];

      goto LABEL_24;
    }

    id v23 = 0;
    id v16 = v5;
LABEL_40:
    v19 = 0;
    if (!a3) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  id v15 = *p_content;
LABEL_24:
  id v16 = v5;
LABEL_25:
  v19 = v15;
  uint64_t v38 = [(NSData *)v19 bytes];
  uint64_t v37 = [(NSData *)v19 length];
  uint64_t v39 = [(MSOID *)self->_contentType Asn1OID];
  uint64_t v40 = v20;
  v35[0] = 0;
  uint64_t v21 = length_ContentInfo((uint64_t)&v39);
  v22 = [MEMORY[0x263EFF990] dataWithLength:v21];
  if (!v22)
  {
    uint64_t v26 = 12;
LABEL_29:
    v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = *MEMORY[0x263F08320];
    v43 = @"Failed encoding type ContentInfo";
    v28 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    uint64_t v29 = [v27 errorWithDomain:@"com.apple.HeimASN1" code:v26 userInfo:v28];

    id v23 = 0;
    id v16 = (id)v29;
    if (!a3) {
      goto LABEL_35;
    }
LABEL_33:
    if (v16) {
      *a3 = v16;
    }
    goto LABEL_35;
  }
  id v23 = v22;
  int v24 = encode_ContentInfo([v23 mutableBytes] + v21 - 1, v21, (uint64_t)&v39, (uint64_t)v35);
  if (v24)
  {
    int v25 = v24;

    uint64_t v26 = v25;
    goto LABEL_29;
  }
  if (v21 != v35[0])
  {
LABEL_43:
    v31 = (MSCMSContentInfo *)asn1_abort();
    return [(MSCMSContentInfo *)v31 initWithEmbeddedContent:v33];
  }
  if (a3) {
    goto LABEL_33;
  }
LABEL_35:

  return v23;
}

- (MSCMSContentInfo)initWithEmbeddedContent:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSCMSContentInfo;
  v6 = [(MSCMSContentInfo *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_embeddedContent, a3);
    uint64_t v8 = [v5 type];
    contentType = v7->_contentType;
    v7->_contentType = (MSOID *)v8;
  }
  return v7;
}

- (MSCMSContentInfo)initWithDataContent:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSCMSContentInfo;
  v6 = [(MSCMSContentInfo *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_content, a3);
    uint64_t v8 = +[MSOID OIDWithString:@"1.2.840.113549.1.7.1" error:0];
    contentType = v7->_contentType;
    v7->_contentType = (MSOID *)v8;
  }
  return v7;
}

- (NSData)content
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

@end
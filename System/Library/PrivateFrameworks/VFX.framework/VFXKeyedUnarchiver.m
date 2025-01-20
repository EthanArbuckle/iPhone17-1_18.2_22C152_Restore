@interface VFXKeyedUnarchiver
- (NSArray)allTargetsFromAnimCodec;
- (NSDictionary)context;
- (NSString)lookUpKey;
- (NSURL)documentEnclosingURL;
- (NSURL)documentURL;
- (id)initForReadingWithData:(id)a3 secure:(BOOL)a4;
- (id)lookUpFoundInstance;
- (void)dealloc;
- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4;
- (void)setAllTargetsFromAnimCodec:(id)a3;
- (void)setContext:(id)a3;
- (void)setDocumentURL:(id)a3;
- (void)setLookUpFoundInstance:(id)a3;
- (void)setLookUpKey:(id)a3;
@end

@implementation VFXKeyedUnarchiver

- (id)initForReadingWithData:(id)a3 secure:(BOOL)a4
{
  BOOL v4 = a4;
  v20.receiver = self;
  v20.super_class = (Class)VFXKeyedUnarchiver;
  v21 = 0;
  id v5 = [(VFXKeyedUnarchiver *)&v20 initForReadingFromData:a3 error:&v21];
  v9 = v5;
  if (v5)
  {
    objc_msgSend_setDecodingFailurePolicy_(v5, v6, 0, v8);
    objc_msgSend_setRequiresSecureCoding_(v9, v10, v4, v11);
  }
  if (v21)
  {
    uint64_t v12 = objc_msgSend_localizedDescription(v21, v6, v7, v8);
    sub_1B63F2F54(16, @"Error: Failed to instantiate unarchiver with error %@", v13, v14, v15, v16, v17, v18, v12);
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXKeyedUnarchiver;
  [(VFXKeyedUnarchiver *)&v3 dealloc];
}

- (NSURL)documentEnclosingURL
{
  BOOL v4 = objc_msgSend_documentURL(self, a2, v2, v3);

  return (NSURL *)objc_msgSend_URLByDeletingLastPathComponent(v4, v5, v6, v7);
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  if (!strcmp(a3, "{CATransform3D=dddddddddddddddd}"))
  {
    uint64_t v23 = 0;
    v9 = (float32x2_t *)objc_msgSend_decodeBytesWithReturnedLength_(self, v7, (uint64_t)&v23, v8);
    if (v23 == 64)
    {
      sub_1B651FE74(v9, (float64x2_t *)a4);
    }
    else
    {
      sub_1B63F2F54(16, @"Error: decodeValueOfObjCType - failed to decode CATransform3D", v10, v11, v12, v13, v14, v15, v21);
      uint64_t v16 = (_OWORD *)MEMORY[0x1E4F39B10];
      long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      *((_OWORD *)a4 + 4) = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      *((_OWORD *)a4 + 5) = v17;
      long long v18 = v16[7];
      *((_OWORD *)a4 + 6) = v16[6];
      *((_OWORD *)a4 + 7) = v18;
      long long v19 = v16[1];
      *(_OWORD *)a4 = *v16;
      *((_OWORD *)a4 + 1) = v19;
      long long v20 = v16[3];
      *((_OWORD *)a4 + 2) = v16[2];
      *((_OWORD *)a4 + 3) = v20;
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)VFXKeyedUnarchiver;
    [(VFXKeyedUnarchiver *)&v22 decodeValueOfObjCType:a3 at:a4];
  }
}

- (NSURL)documentURL
{
  return self->_documentURL;
}

- (void)setDocumentURL:(id)a3
{
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)lookUpKey
{
  return self->_lookUpKey;
}

- (void)setLookUpKey:(id)a3
{
}

- (id)lookUpFoundInstance
{
  return self->_lookUpFoundInstance;
}

- (void)setLookUpFoundInstance:(id)a3
{
}

- (NSArray)allTargetsFromAnimCodec
{
  return self->_allTargetsFromAnimCodec;
}

- (void)setAllTargetsFromAnimCodec:(id)a3
{
}

@end
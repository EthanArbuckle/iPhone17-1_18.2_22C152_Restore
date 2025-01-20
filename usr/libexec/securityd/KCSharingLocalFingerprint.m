@interface KCSharingLocalFingerprint
- (BOOL)isEqual:(id)a3;
- (KCSharingLocalFingerprint)initWithDatabaseItem:(SecDbItem *)a3 error:(id *)a4;
- (KCSharingLocalFingerprint)initWithKeyprint:(id)a3 valueprint:(id)a4;
- (NSData)keyprint;
- (NSData)valueprint;
- (id)description;
- (unint64_t)hash;
@end

@implementation KCSharingLocalFingerprint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueprint, 0);

  objc_storeStrong((id *)&self->_keyprint, 0);
}

- (NSData)valueprint
{
  return self->_valueprint;
}

- (NSData)keyprint
{
  return self->_keyprint;
}

- (id)description
{
  v3 = [(KCSharingLocalFingerprint *)self keyprint];
  v4 = [v3 base64EncodedDataWithOptions:0];
  v5 = [(KCSharingLocalFingerprint *)self valueprint];
  v6 = [v5 base64EncodedDataWithOptions:0];
  v7 = +[NSString stringWithFormat:@"KCSharingLocalFingerprint(keyprint:%@ valueprint:%@)", v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (KCSharingLocalFingerprint *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else if ([(KCSharingLocalFingerprint *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    keyprint = self->_keyprint;
    v7 = [(KCSharingLocalFingerprint *)v5 keyprint];
    if ([(NSData *)keyprint isEqualToData:v7])
    {
      valueprint = self->_valueprint;
      v9 = [(KCSharingLocalFingerprint *)v5 valueprint];
      unsigned __int8 v10 = [(NSData *)valueprint isEqualToData:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = [(NSData *)self->_keyprint hash];
  return (unsigned char *)[(NSData *)self->_valueprint hash] - (unsigned char *)v3 + 32 * (void)v3;
}

- (KCSharingLocalFingerprint)initWithKeyprint:(id)a3 valueprint:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KCSharingLocalFingerprint;
  v9 = [(KCSharingLocalFingerprint *)&v12 init];
  unsigned __int8 v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyprint, a3);
    objc_storeStrong((id *)&v10->_valueprint, a4);
  }

  return v10;
}

- (KCSharingLocalFingerprint)initWithDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  v33 = 0;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  var1 = a3->var1;
  objc_super v12 = var1->var2[0];
  if (v12)
  {
    v13 = &var1->var2[1];
    do
    {
      if ((~LODWORD(v12->var2) & 3) == 0)
      {
        v18 = sub_10011BB4C((CFMutableDictionaryRef *)a3, v12, &v33);
        if (!v18) {
          goto LABEL_19;
        }
        CFDictionarySetValue(Mutable, v12->var0, v18);
        CFRelease(v18);
      }
      v19 = *v13++;
      objc_super v12 = v19;
    }
    while (v19);
  }
  v20 = sub_1000298CC((const __CFString *)Mutable, (CFTypeRef *)&v33, v7, v8, v9);
  v18 = v20;
  if (v20)
  {
    v21 = sub_100029CBC(v20);
    if (!Mutable) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  v21 = 0;
  if (Mutable) {
LABEL_9:
  }
    CFRelease(Mutable);
LABEL_10:
  if (v18) {
    CFRelease(v18);
  }
  if (!v21)
  {
    v28 = v33;
    sub_100047078(a4, 23, v33, @"Copying keyprint", v14, v15, v16, v17, v32);
LABEL_17:
    v29 = 0;
    goto LABEL_18;
  }
  uint64_t v22 = sub_100118974(&a3->var1->var0, 7, &v33);
  uint64_t v23 = sub_100118CF8(a3, v22, &v33);
  if (!v23)
  {
    v30 = v33;
    sub_100047078(a4, 24, v33, @"Copying valueprint", v24, v25, v26, v27, v32);

    v28 = 0;
    goto LABEL_17;
  }
  v28 = (__CFString *)v23;
  self = [(KCSharingLocalFingerprint *)self initWithKeyprint:v21 valueprint:v23];
  v29 = self;
LABEL_18:

  return v29;
}

@end
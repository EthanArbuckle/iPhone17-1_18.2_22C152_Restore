@interface CommonPlist
- (CommonPlist)init;
- (int)readPlist:(id)a3;
@end

@implementation CommonPlist

- (CommonPlist)init
{
  v3.receiver = self;
  v3.super_class = (Class)CommonPlist;
  result = [(CommonPlist *)&v3 init];
  if (result) {
    *(_OWORD *)&result->nrfVersion = xmmword_263117E30;
  }
  return result;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"FigMetalAllocatorType", v6);
  v11 = v7;
  if (v7) {
    self->allocatorType = objc_msgSend_intValue(v7, v8, v9, v10);
  }

  v14 = objc_msgSend_objectForKeyedSubscript_(v4, v12, @"FigMetalAllocatorAllowFallback", v13);
  v18 = v14;
  if (v14) {
    self->allowFallback = objc_msgSend_BOOLValue(v14, v15, v16, v17);
  }

  v21 = objc_msgSend_objectForKeyedSubscript_(v4, v19, @"FigMetalAllocatorCompressionLevel", v20);
  v25 = v21;
  if (v21) {
    self->compressionLevel = objc_msgSend_intValue(v21, v22, v23, v24);
  }

  return 0;
}

@end
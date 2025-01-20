@interface PLPTPConversionResult
- (BOOL)requiresConversion;
- (NSString)pathExtension;
- (PLPTPConversionResult)initWithRequiresConversion:(BOOL)a3 pathExtension:(id)a4 estimatedFileLength:(unint64_t)a5 inputVideoCodec:(unsigned int)a6 inputContentType:(id)a7 outputVideoCodec:(unsigned int)a8 outputContentType:(id)a9;
- (UTType)inputContentType;
- (UTType)outputContentType;
- (id)description;
- (unint64_t)estimatedFileLength;
- (unsigned)inputVideoCodec;
- (unsigned)outputVideoCodec;
@end

@implementation PLPTPConversionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContentType, 0);
  objc_storeStrong((id *)&self->_inputContentType, 0);
  objc_storeStrong((id *)&self->_pathExtension, 0);
}

- (UTType)outputContentType
{
  return (UTType *)objc_getProperty(self, a2, 48, 1);
}

- (unsigned)outputVideoCodec
{
  return self->_outputVideoCodec;
}

- (UTType)inputContentType
{
  return (UTType *)objc_getProperty(self, a2, 40, 1);
}

- (unsigned)inputVideoCodec
{
  return self->_inputVideoCodec;
}

- (unint64_t)estimatedFileLength
{
  return self->_estimatedFileLength;
}

- (NSString)pathExtension
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)requiresConversion
{
  return self->_requiresConversion;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<PLPTPConversionResult requiresConversion=%d extension=%@ estimatedFileLength=%llu outputContentType=%@>", self->_requiresConversion, self->_pathExtension, self->_estimatedFileLength, self->_outputContentType];
}

- (PLPTPConversionResult)initWithRequiresConversion:(BOOL)a3 pathExtension:(id)a4 estimatedFileLength:(unint64_t)a5 inputVideoCodec:(unsigned int)a6 inputContentType:(id)a7 outputVideoCodec:(unsigned int)a8 outputContentType:(id)a9
{
  id v15 = a4;
  id v16 = a7;
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)PLPTPConversionResult;
  v18 = [(PLPTPConversionResult *)&v24 init];
  v19 = v18;
  if (v18)
  {
    v18->_requiresConversion = a3;
    uint64_t v20 = [v15 copy];
    pathExtension = v19->_pathExtension;
    v19->_pathExtension = (NSString *)v20;

    v19->_estimatedFileLength = a5;
    v19->_inputVideoCodec = a6;
    objc_storeStrong((id *)&v19->_inputContentType, a7);
    v19->_outputVideoCodec = a8;
    objc_storeStrong((id *)&v19->_outputContentType, a9);
    v22 = v19;
  }

  return v19;
}

@end
@interface TRIBlockBasedSysdiagnoseInfoProvider
- (NSString)outputFilename;
- (TRIBlockBasedSysdiagnoseInfoProvider)initWithOutputFilename:(id)a3 block:(id)a4;
- (id)block;
- (id)sysdiagnoseLinesWithError:(id *)a3;
@end

@implementation TRIBlockBasedSysdiagnoseInfoProvider

- (TRIBlockBasedSysdiagnoseInfoProvider)initWithOutputFilename:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TRIBlockBasedSysdiagnoseInfoProvider;
  v9 = [(TRIBlockBasedSysdiagnoseInfoProvider *)&v13 init];
  if (v9)
  {
    uint64_t v10 = MEMORY[0x19F3AD290](v8);
    id block = v9->_block;
    v9->_id block = (id)v10;

    objc_storeStrong((id *)&v9->_outputFilename, a3);
  }

  return v9;
}

- (id)sysdiagnoseLinesWithError:(id *)a3
{
  v4 = [(TRIBlockBasedSysdiagnoseInfoProvider *)self block];
  v5 = ((void (**)(void, id *))v4)[2](v4, a3);

  return v5;
}

- (id)block
{
  return self->_block;
}

- (NSString)outputFilename
{
  return self->_outputFilename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
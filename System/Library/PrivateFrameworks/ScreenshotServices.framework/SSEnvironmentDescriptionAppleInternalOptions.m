@interface SSEnvironmentDescriptionAppleInternalOptions
+ (BOOL)supportsBSXPCSecureCoding;
- (RCPMovie)recapMovie;
- (SSEnvironmentDescriptionAppleInternalOptions)initWithBSXPCCoder:(id)a3;
- (SSUIRunPPTServiceRequest)runPPTServiceRequest;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setRecapMovie:(id)a3;
- (void)setRunPPTServiceRequest:(id)a3;
@end

@implementation SSEnvironmentDescriptionAppleInternalOptions

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SSEnvironmentDescriptionAppleInternalOptions)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SSEnvironmentDescriptionAppleInternalOptions *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentDescriptionAppleInternalOptionsRunPPTServiceRequest"];
  runPPTServiceRequest = v5->_runPPTServiceRequest;
  v5->_runPPTServiceRequest = (SSUIRunPPTServiceRequest *)v6;

  if (RecapLibraryCore())
  {
    v8 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8708] forKey:@"SSEnvironmentDescriptionAppleInternalRecapKey"];
    if (v8)
    {
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x2050000000;
      v9 = (void *)getRCPMovieClass_softClass;
      uint64_t v18 = getRCPMovieClass_softClass;
      if (!getRCPMovieClass_softClass)
      {
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __getRCPMovieClass_block_invoke;
        v14[3] = &unk_2644ED6B8;
        v14[4] = &v15;
        __getRCPMovieClass_block_invoke((uint64_t)v14);
        v9 = (void *)v16[3];
      }
      v10 = v9;
      _Block_object_dispose(&v15, 8);
      uint64_t v11 = [[v10 alloc] initWithXPC:v8];
      recapMovie = v5->_recapMovie;
      v5->_recapMovie = (RCPMovie *)v11;
    }
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(SSEnvironmentDescriptionAppleInternalOptions *)self runPPTServiceRequest];
  [v10 encodeObject:v4 forKey:@"SSEnvironmentDescriptionAppleInternalOptionsRunPPTServiceRequest"];

  uint64_t v5 = [(SSEnvironmentDescriptionAppleInternalOptions *)self recapMovie];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = RecapLibraryCore();

    if (v7)
    {
      v8 = [(SSEnvironmentDescriptionAppleInternalOptions *)self recapMovie];
      v9 = [v8 encodeToXPC];
      [v10 encodeXPCObject:v9 forKey:@"SSEnvironmentDescriptionAppleInternalRecapKey"];
    }
  }
}

- (SSUIRunPPTServiceRequest)runPPTServiceRequest
{
  return self->_runPPTServiceRequest;
}

- (void)setRunPPTServiceRequest:(id)a3
{
}

- (RCPMovie)recapMovie
{
  return self->_recapMovie;
}

- (void)setRecapMovie:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recapMovie, 0);
  objc_storeStrong((id *)&self->_runPPTServiceRequest, 0);
}

@end
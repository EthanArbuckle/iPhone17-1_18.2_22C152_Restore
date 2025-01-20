@interface ICASOrientationData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASDeviceOrientation)deviceOrientation;
- (ICASInterfaceOrientation)interfaceOrientation;
- (ICASOrientationData)initWithDeviceOrientation:(id)a3 interfaceOrientation:(id)a4;
- (id)toDict;
@end

@implementation ICASOrientationData

- (ICASOrientationData)initWithDeviceOrientation:(id)a3 interfaceOrientation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASOrientationData;
  v9 = [(ICASOrientationData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceOrientation, a3);
    objc_storeStrong((id *)&v10->_interfaceOrientation, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"OrientationData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"deviceOrientation";
  v3 = [(ICASOrientationData *)self deviceOrientation];
  if (v3)
  {
    uint64_t v4 = [(ICASOrientationData *)self deviceOrientation];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"interfaceOrientation";
  v12[0] = v4;
  v6 = [(ICASOrientationData *)self interfaceOrientation];
  if (v6)
  {
    uint64_t v7 = [(ICASOrientationData *)self interfaceOrientation];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (ICASDeviceOrientation)deviceOrientation
{
  return self->_deviceOrientation;
}

- (ICASInterfaceOrientation)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceOrientation, 0);
  objc_storeStrong((id *)&self->_deviceOrientation, 0);
}

@end
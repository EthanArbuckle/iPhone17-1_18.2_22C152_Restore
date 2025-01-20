@interface SUControllerScanOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)downloadWhenFound;
- (BOOL)isEqual:(id)a3;
- (BOOL)userInitiated;
- (SUControllerScanOptions)init;
- (SUControllerScanOptions)initWithCoder:(id)a3;
- (id)copy;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setDownloadWhenFound:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation SUControllerScanOptions

- (SUControllerScanOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUControllerScanOptions;
  result = [(SUControllerScanOptions *)&v3 init];
  if (result) {
    *(_WORD *)&result->_userInitiated = 257;
  }
  return result;
}

- (SUControllerScanOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUControllerScanOptions;
  v5 = [(SUControllerScanOptions *)&v7 init];
  if (v5)
  {
    v5->_userInitiated = [v4 decodeBoolForKey:@"userInitiated"];
    v5->_downloadWhenFound = [v4 decodeBoolForKey:@"downloadWhenFound"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SUControllerScanOptions userInitiated](self, "userInitiated"), @"userInitiated");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUControllerScanOptions downloadWhenFound](self, "downloadWhenFound"), @"downloadWhenFound");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_super v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [(SUControllerScanOptions *)self userInitiated];
  if (v5 == [v4 userInitiated])
  {
    BOOL v7 = [(SUControllerScanOptions *)self downloadWhenFound];
    int v6 = v7 ^ [v4 downloadWhenFound] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)description
{
  objc_super v3 = NSString;
  if ([(SUControllerScanOptions *)self userInitiated]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  if ([(SUControllerScanOptions *)self downloadWhenFound]) {
    int v5 = @"YES";
  }
  else {
    int v5 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"\n        userInitiated: %@\n    downloadWhenFound: %@", v4, v5];
}

- (id)summary
{
  objc_super v3 = NSString;
  if ([(SUControllerScanOptions *)self userInitiated]) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  if ([(SUControllerScanOptions *)self downloadWhenFound]) {
    int v5 = @"Y";
  }
  else {
    int v5 = @"N";
  }
  return (id)[v3 stringWithFormat:@"userInitiated:%@,downloadWhenFound:%@", v4, v5];
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)downloadWhenFound
{
  return self->_downloadWhenFound;
}

- (void)setDownloadWhenFound:(BOOL)a3
{
  self->_downloadWhenFound = a3;
}

@end
@interface MFPPath
- (MFPPath)initWithPath:(id)a3;
- (id)path;
- (void)dealloc;
@end

@implementation MFPPath

- (MFPPath)initWithPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFPPath;
  v6 = [(MFPPath *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mPath, a3);
  }

  return v7;
}

- (void)dealloc
{
  mPath = self->mPath;
  self->mPath = 0;

  v4.receiver = self;
  v4.super_class = (Class)MFPPath;
  [(MFPPath *)&v4 dealloc];
}

- (id)path
{
  return self->mPath;
}

- (void).cxx_destruct
{
}

@end
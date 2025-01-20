@interface TRIPBFileDescriptor
- (NSString)objcPrefix;
- (NSString)package;
- (TRIPBFileDescriptor)initWithPackage:(id)a3 objcPrefix:(id)a4 syntax:(unsigned __int8)a5;
- (TRIPBFileDescriptor)initWithPackage:(id)a3 syntax:(unsigned __int8)a4;
- (unsigned)syntax;
- (void)dealloc;
@end

@implementation TRIPBFileDescriptor

- (unsigned)syntax
{
  return self->syntax_;
}

- (TRIPBFileDescriptor)initWithPackage:(id)a3 syntax:(unsigned __int8)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TRIPBFileDescriptor;
  v6 = [(TRIPBFileDescriptor *)&v8 init];
  if (v6)
  {
    v6->package_ = (NSString *)[a3 copy];
    v6->syntax_ = a4;
  }
  return v6;
}

- (TRIPBFileDescriptor)initWithPackage:(id)a3 objcPrefix:(id)a4 syntax:(unsigned __int8)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TRIPBFileDescriptor;
  objc_super v8 = [(TRIPBFileDescriptor *)&v10 init];
  if (v8)
  {
    v8->package_ = (NSString *)[a3 copy];
    v8->objcPrefix_ = (NSString *)[a4 copy];
    v8->syntax_ = a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TRIPBFileDescriptor;
  [(TRIPBFileDescriptor *)&v3 dealloc];
}

- (NSString)package
{
  return self->package_;
}

- (NSString)objcPrefix
{
  return self->objcPrefix_;
}

@end
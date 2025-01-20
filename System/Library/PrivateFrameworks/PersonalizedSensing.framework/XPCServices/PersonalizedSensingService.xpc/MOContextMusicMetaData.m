@interface MOContextMusicMetaData
+ (BOOL)supportsSecureCoding;
- (MOContextMusicMetaData)init;
- (MOContextMusicMetaData)initWithCoder:(id)a3;
- (MOContextMusicMetaData)initWithMusicMetaDataMO:(id)a3;
- (MOContextMusicMetaData)initWithMusicString:(id)a3;
- (NSString)musicString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOContextMusicMetaData

- (MOContextMusicMetaData)initWithMusicMetaDataMO:(id)a3
{
  if (a3)
  {
    v4 = [a3 musicString];
    self = [(MOContextMusicMetaData *)self initWithMusicString:v4];

    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MOContextMusicMetaData)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOContextMusicMetaData;
  return [(MOContextMusicMetaData *)&v3 init];
}

- (MOContextMusicMetaData)initWithMusicString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOContextMusicMetaData;
  v6 = [(MOContextMusicMetaData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_musicString, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MOContextMusicMetaData alloc];
  id v5 = [(MOContextMusicMetaData *)self musicString];
  v6 = [(MOContextMusicMetaData *)v4 initWithMusicString:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MOContextMusicMetaData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"musicString"];

  v6 = [(MOContextMusicMetaData *)self initWithMusicString:v5];
  return v6;
}

- (id)description
{
  v2 = [(MOContextMusicMetaData *)self musicString];
  objc_super v3 = [v2 mask];
  id v4 = +[NSString stringWithFormat:@"music string, %@", v3];

  return v4;
}

- (NSString)musicString
{
  return self->_musicString;
}

- (void).cxx_destruct
{
}

@end
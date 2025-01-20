@interface STMutableStatusItemVisualDescriptor
- (NSString)imageName;
- (NSString)packageName;
- (NSString)systemImageName;
- (NSString)textLabel;
- (void)setImageName:(id)a3;
- (void)setPackageName:(id)a3;
- (void)setSystemImageName:(id)a3;
- (void)setTextLabel:(id)a3;
@end

@implementation STMutableStatusItemVisualDescriptor

- (NSString)systemImageName
{
  return self->systemImageName;
}

- (void)setSystemImageName:(id)a3
{
}

- (NSString)imageName
{
  return self->imageName;
}

- (void)setImageName:(id)a3
{
}

- (NSString)packageName
{
  return self->packageName;
}

- (void)setPackageName:(id)a3
{
}

- (NSString)textLabel
{
  return self->textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->textLabel, 0);
  objc_storeStrong((id *)&self->packageName, 0);
  objc_storeStrong((id *)&self->imageName, 0);

  objc_storeStrong((id *)&self->systemImageName, 0);
}

@end
@interface SLDCloudKitConfiguration
- (CKContainer)container;
- (NSString)name;
- (void)setContainer:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SLDCloudKitConfiguration

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
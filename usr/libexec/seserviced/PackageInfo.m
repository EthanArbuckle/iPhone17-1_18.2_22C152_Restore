@interface PackageInfo
- (id)description;
@end

@implementation PackageInfo

- (id)description
{
  v3 = [(NSMutableArray *)self->_moduleAIDs ses_map:&stru_10040C300];
  v4 = [(NSData *)self->_packageAID asHexString];
  v5 = +[NSString stringWithFormat:@"Package: %@ (modules %@)", v4, v3];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleAIDs, 0);

  objc_storeStrong((id *)&self->_packageAID, 0);
}

@end
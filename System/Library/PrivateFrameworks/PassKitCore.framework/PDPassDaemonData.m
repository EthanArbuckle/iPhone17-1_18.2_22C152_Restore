@interface PDPassDaemonData
- (PDPassDaemonData)init;
- (id)description;
@end

@implementation PDPassDaemonData

- (PDPassDaemonData)init
{
  return 0;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@: %p; ", v4, self];

  [v5 appendFormat:@"shareBunde: '%@'; ", self->_shareBundle];
  objc_msgSend(v5, "appendFormat:", @"secureElementPassFieldCollection: '%@'; ",
    self->_secureElementPassFieldCollection);
  [v5 appendFormat:@"tileDescriptors: '%@'; ", self->_descriptors];
  [v5 appendFormat:@">"];
  v6 = +[NSString stringWithString:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareBundle, 0);
  objc_storeStrong((id *)&self->_secureElementPassFieldCollection, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
}

@end
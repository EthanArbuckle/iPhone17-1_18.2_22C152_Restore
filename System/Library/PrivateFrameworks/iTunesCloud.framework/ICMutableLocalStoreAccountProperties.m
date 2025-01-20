@interface ICMutableLocalStoreAccountProperties
- (id)copyWithZone:(_NSZone *)a3;
- (void)setStorefrontIdentifier:(id)a3;
@end

@implementation ICMutableLocalStoreAccountProperties

- (void)setStorefrontIdentifier:(id)a3
{
  v9 = (NSString *)a3;
  v4 = self->super._storefrontIdentifier;
  storefrontIdentifier = v9;
  if (v4 != v9)
  {
    v6 = v4;
    char v7 = [(NSString *)v4 isEqual:v9];

    if (v7) {
      goto LABEL_5;
    }
    v8 = (NSString *)[(NSString *)v9 copy];
    storefrontIdentifier = self->super._storefrontIdentifier;
    self->super._storefrontIdentifier = v8;
  }

LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ICLocalStoreAccountProperties allocWithZone:](ICLocalStoreAccountProperties, "allocWithZone:") init];
  if (v5) {
    [(ICLocalStoreAccountProperties *)self _copyLocalStoreAccountPropertiesToOtherInstance:v5 withZone:a3];
  }
  return v5;
}

@end
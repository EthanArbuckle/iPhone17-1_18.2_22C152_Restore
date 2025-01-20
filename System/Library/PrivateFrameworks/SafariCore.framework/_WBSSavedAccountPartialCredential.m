@interface _WBSSavedAccountPartialCredential
- (BOOL)isDefaultCredentialForProtectionSpace;
- (NSData)persistentIdentifier;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSURLProtectionSpace)protectionSpace;
- (_WBSSavedAccountPartialCredential)initWithProtectionSpace:(id)a3 modificationDate:(id)a4 creationDate:(id)a5 persistentIdentifier:(id)a6 isDefaultCredentialForProtectionSpace:(BOOL)a7;
@end

@implementation _WBSSavedAccountPartialCredential

- (_WBSSavedAccountPartialCredential)initWithProtectionSpace:(id)a3 modificationDate:(id)a4 creationDate:(id)a5 persistentIdentifier:(id)a6 isDefaultCredentialForProtectionSpace:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_WBSSavedAccountPartialCredential;
  v17 = [(_WBSSavedAccountPartialCredential *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_protectionSpace, a3);
    objc_storeStrong((id *)&v18->_modificationDate, a4);
    objc_storeStrong((id *)&v18->_creationDate, a5);
    objc_storeStrong((id *)&v18->_persistentIdentifier, a6);
    v18->_defaultCredentialForProtectionSpace = a7;
    v19 = v18;
  }

  return v18;
}

- (NSURLProtectionSpace)protectionSpace
{
  return self->_protectionSpace;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSData)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (BOOL)isDefaultCredentialForProtectionSpace
{
  return self->_defaultCredentialForProtectionSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_protectionSpace, 0);
}

@end
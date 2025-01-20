@interface _UNNotificationContactServiceRecord
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (_UNNotificationContact)contact;
- (unint64_t)hash;
- (void)setBundleIdentifier:(id)a3;
- (void)setContact:(id)a3;
@end

@implementation _UNNotificationContactServiceRecord

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
LABEL_7:
      char v11 = 0;
      goto LABEL_8;
    }
  }
  id v5 = v4;
  v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  bundleIdentifier = self->_bundleIdentifier;
  v8 = [v5 bundleIdentifier];
  LODWORD(bundleIdentifier) = NCIsEqual(bundleIdentifier, v8);

  if (!bundleIdentifier) {
    goto LABEL_7;
  }
  contact = self->_contact;
  v10 = [v6 contact];
  char v11 = [(_UNNotificationContact *)contact isSimilar:v10];

LABEL_8:
  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(_UNNotificationContact *)self->_contact similarHash];
  return [(NSString *)self->_bundleIdentifier hash] + v3;
}

- (_UNNotificationContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end
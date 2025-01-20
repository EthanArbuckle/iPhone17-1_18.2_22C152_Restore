@interface WBSPasswordImportedCredential
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)notesEntry;
- (NSString)password;
- (NSString)title;
- (NSString)user;
- (NSURL)otpAuthURL;
- (NSURL)url;
- (WBSPasswordImportedCredential)init;
- (WBSPasswordImportedCredential)initWithCoder:(id)a3;
- (WBSPasswordImportedCredential)initWithUser:(id)a3 password:(id)a4 url:(id)a5;
- (WBSPasswordImportedCredential)initWithUser:(id)a3 password:(id)a4 url:(id)a5 otpAuthURL:(id)a6 title:(id)a7 notesEntry:(id)a8 lineNumberFromSourceFile:(unint64_t)a9;
- (id)description;
- (id)encryptedURLCredentialWithPersistence:(unint64_t)a3;
- (id)urlCredentialWithPersistence:(unint64_t)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)lineNumberFromSourceFile;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSPasswordImportedCredential

- (WBSPasswordImportedCredential)initWithUser:(id)a3 password:(id)a4 url:(id)a5
{
  return [(WBSPasswordImportedCredential *)self initWithUser:a3 password:a4 url:a5 otpAuthURL:0 title:0 notesEntry:0 lineNumberFromSourceFile:0];
}

- (WBSPasswordImportedCredential)initWithUser:(id)a3 password:(id)a4 url:(id)a5 otpAuthURL:(id)a6 title:(id)a7 notesEntry:(id)a8 lineNumberFromSourceFile:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v36.receiver = self;
  v36.super_class = (Class)WBSPasswordImportedCredential;
  v21 = [(WBSPasswordImportedCredential *)&v36 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    v23 = (void *)v22;
    if (v22) {
      v24 = (__CFString *)v22;
    }
    else {
      v24 = &stru_1EFBE3CF8;
    }
    objc_storeStrong((id *)&v21->_user, v24);

    uint64_t v25 = [v16 copy];
    v26 = (void *)v25;
    if (v25) {
      v27 = (__CFString *)v25;
    }
    else {
      v27 = &stru_1EFBE3CF8;
    }
    objc_storeStrong((id *)&v21->_password, v27);

    objc_storeStrong((id *)&v21->_url, a5);
    uint64_t v28 = [v18 copy];
    otpAuthURL = v21->_otpAuthURL;
    v21->_otpAuthURL = (NSURL *)v28;

    uint64_t v30 = [v19 copy];
    title = v21->_title;
    v21->_title = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    notesEntry = v21->_notesEntry;
    v21->_notesEntry = (NSString *)v32;

    v21->_lineNumberFromSourceFile = a9;
    v34 = v21;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSPasswordImportedCredential *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(WBSPasswordImportedCredential *)v5 user];
      if (WBSIsEqual())
      {
        v7 = [(WBSPasswordImportedCredential *)v5 otpAuthURL];
        if (WBSIsEqual())
        {
          v8 = [(WBSPasswordImportedCredential *)v5 notesEntry];
          if (WBSIsEqual())
          {
            v9 = [(WBSPasswordImportedCredential *)v5 title];
            if (WBSIsEqual())
            {
              v10 = [(WBSPasswordImportedCredential *)v5 password];
              if (WBSIsEqual())
              {
                v11 = [(WBSPasswordImportedCredential *)v5 url];
                if (WBSIsEqual())
                {
                  unint64_t lineNumberFromSourceFile = self->_lineNumberFromSourceFile;
                  BOOL v13 = lineNumberFromSourceFile == [(WBSPasswordImportedCredential *)v5 lineNumberFromSourceFile];
                }
                else
                {
                  BOOL v13 = 0;
                }
              }
              else
              {
                BOOL v13 = 0;
              }
            }
            else
            {
              BOOL v13 = 0;
            }
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_user hash];
  NSUInteger v4 = [(NSString *)self->_password hash] ^ v3;
  uint64_t v5 = [(NSURL *)self->_url hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSURL *)self->_otpAuthURL hash];
  NSUInteger v7 = [(NSString *)self->_notesEntry hash];
  return v6 ^ v7 ^ [(NSString *)self->_title hash] ^ self->_lineNumberFromSourceFile;
}

- (id)urlCredentialWithPersistence:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F18D88], "safari_credentialWithUser:password:persistence:", self->_user, self->_password, a3);
}

- (id)encryptedURLCredentialWithPersistence:(unint64_t)a3
{
  return 0;
}

- (WBSPasswordImportedCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"user"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"password"];
  NSUInteger v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otp"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notes"];
  uint64_t v11 = [v4 decodeIntegerForKey:@"lineNumberFromSourceFile"];

  v12 = [(WBSPasswordImportedCredential *)self initWithUser:v5 password:v6 url:v7 otpAuthURL:v8 title:v9 notesEntry:v10 lineNumberFromSourceFile:v11];
  return v12;
}

- (WBSPasswordImportedCredential)init
{
  return [(WBSPasswordImportedCredential *)self initWithUser:0 password:0 url:0];
}

- (void)encodeWithCoder:(id)a3
{
  user = self->_user;
  id v5 = a3;
  [v5 encodeObject:user forKey:@"user"];
  [v5 encodeObject:self->_password forKey:@"password"];
  [v5 encodeObject:self->_url forKey:@"url"];
  [v5 encodeObject:self->_otpAuthURL forKey:@"otp"];
  [v5 encodeObject:self->_notesEntry forKey:@"notes"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeInt:LODWORD(self->_lineNumberFromSourceFile) forKey:@"lineNumberFromSourceFile"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; url = \"%@\"; user = \"%@\">; hasPassword = %d; otpAuthURL = \"%@\">; title = \"%@\"; hash(notesEntry) = \"%lu\">; unint64_t lineNumberFromSourceFile = \"%lu\";",
               objc_opt_class(),
               self,
               self->_url,
               self->_user,
               [(NSString *)self->_password length] != 0,
               self->_otpAuthURL,
               self->_title,
               [(NSString *)self->_notesEntry hash],
               self->_lineNumberFromSourceFile);
}

- (int64_t)compare:(id)a3
{
  unint64_t lineNumberFromSourceFile = self->_lineNumberFromSourceFile;
  unint64_t v4 = *((void *)a3 + 7);
  BOOL v5 = lineNumberFromSourceFile >= v4;
  int64_t v6 = lineNumberFromSourceFile > v4;
  if (v5) {
    return v6;
  }
  else {
    return -1;
  }
}

- (NSString)user
{
  return self->_user;
}

- (NSString)password
{
  return self->_password;
}

- (NSURL)url
{
  return self->_url;
}

- (NSURL)otpAuthURL
{
  return self->_otpAuthURL;
}

- (NSString)notesEntry
{
  return self->_notesEntry;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)lineNumberFromSourceFile
{
  return self->_lineNumberFromSourceFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_notesEntry, 0);
  objc_storeStrong((id *)&self->_otpAuthURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
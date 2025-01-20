@interface SDLegalDoc
+ (BOOL)supportsSecureCoding;
+ (id)legalDocWithID:(int64_t)a3 title:(id)a4 content:(id)a5;
- (NSString)content;
- (NSString)title;
- (SDLegalDoc)initWithCoder:(id)a3;
- (SDLegalDoc)initWithID:(int64_t)a3 title:(id)a4 content:(id)a5;
- (int64_t)legal_id;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(id)a3;
- (void)setLegal_id:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation SDLegalDoc

+ (id)legalDocWithID:(int64_t)a3 title:(id)a4 content:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [[SDLegalDoc alloc] initWithID:a3 title:v8 content:v7];

  return v9;
}

- (SDLegalDoc)initWithID:(int64_t)a3 title:(id)a4 content:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SDLegalDoc;
  v10 = [(SDLegalDoc *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(SDLegalDoc *)v10 setLegal_id:a3];
    [(SDLegalDoc *)v11 setTitle:v8];
    [(SDLegalDoc *)v11 setContent:v9];
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SDLegalDoc legal_id](self, "legal_id"), @"legal_id");
  v5 = [(SDLegalDoc *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  id v6 = [(SDLegalDoc *)self content];
  [v4 encodeObject:v6 forKey:@"content"];
}

- (SDLegalDoc)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SDLegalDoc;
  v5 = [(SDLegalDoc *)&v9 init];
  if (v5)
  {
    -[SDLegalDoc setLegal_id:](v5, "setLegal_id:", [v4 decodeIntegerForKey:@"legal_id"]);
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    [(SDLegalDoc *)v5 setTitle:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
    [(SDLegalDoc *)v5 setContent:v7];
  }
  return v5;
}

- (int64_t)legal_id
{
  return self->_legal_id;
}

- (void)setLegal_id:(int64_t)a3
{
  self->_legal_id = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)content
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
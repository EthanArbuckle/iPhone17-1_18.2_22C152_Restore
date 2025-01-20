@interface ICQImageURL
+ (BOOL)supportsSecureCoding;
- (ICQImageURL)initWithCoder:(id)a3;
- (NSURL)URL1x;
- (NSURL)URL2x;
- (NSURL)URL3x;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setURL1x:(id)a3;
- (void)setURL2x:(id)a3;
- (void)setURL3x:(id)a3;
@end

@implementation ICQImageURL

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQImageURL;
  v5 = [(ICQImageURL *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"1x"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
      [(ICQImageURL *)v5 setURL1x:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"2x"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v8];
      [(ICQImageURL *)v5 setURL2x:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"3x"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v10];
      [(ICQImageURL *)v5 setURL3x:v11];
    }
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"URL1x: %@, URL2x: %@, URL3x: %@", self->_URL1x, self->_URL2x, self->_URL3x];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(ICQImageURL);
  [(ICQImageURL *)v4 setURL1x:self->_URL1x];
  [(ICQImageURL *)v4 setURL2x:self->_URL2x];
  [(ICQImageURL *)v4 setURL3x:self->_URL3x];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  URL1x = self->_URL1x;
  id v5 = a3;
  [v5 encodeObject:URL1x forKey:@"URL1x"];
  [v5 encodeObject:self->_URL2x forKey:@"URL2x"];
  [v5 encodeObject:self->_URL3x forKey:@"URL3x"];
}

- (ICQImageURL)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQImageURL;
  id v5 = [(ICQImageURL *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL1x"];
    URL1x = v5->_URL1x;
    v5->_URL1x = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL2x"];
    URL2x = v5->_URL2x;
    v5->_URL2x = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL3x"];
    URL3x = v5->_URL3x;
    v5->_URL3x = (NSURL *)v10;
  }
  return v5;
}

- (NSURL)URL1x
{
  return self->_URL1x;
}

- (void)setURL1x:(id)a3
{
}

- (NSURL)URL2x
{
  return self->_URL2x;
}

- (void)setURL2x:(id)a3
{
}

- (NSURL)URL3x
{
  return self->_URL3x;
}

- (void)setURL3x:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL3x, 0);
  objc_storeStrong((id *)&self->_URL2x, 0);
  objc_storeStrong((id *)&self->_URL1x, 0);
}

@end
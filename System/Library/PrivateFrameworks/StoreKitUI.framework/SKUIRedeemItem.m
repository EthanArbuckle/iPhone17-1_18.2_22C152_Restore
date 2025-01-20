@interface SKUIRedeemItem
+ (BOOL)supportsSecureCoding;
- (SKUIArtworkProviding)artworks;
- (SKUIRedeemItem)initWithCoder:(id)a3;
- (_NSRange)ageBandRange;
- (id)artworkURLForSize:(int64_t)a3;
- (id)largestArtworkURL;
- (void)encodeWithCoder:(id)a3;
- (void)setArtworks:(id)a3;
@end

@implementation SKUIRedeemItem

- (_NSRange)ageBandRange
{
  NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)artworkURLForSize:(int64_t)a3
{
  v4 = [(SKUIRedeemItem *)self artworks];
  v5 = [v4 artworkURLForSize:a3];

  return v5;
}

- (id)largestArtworkURL
{
  NSUInteger v2 = [(SKUIRedeemItem *)self artworks];
  NSUInteger v3 = [v2 largestArtwork];
  v4 = [v3 URL];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKUIRedeemItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIRedeemItem;
  v5 = [(SKUIRedeemItem *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"title"];
    [(SKUIItem *)v5 setTitle:v6];

    -[SKUIItem setItemIdentifier:](v5, "setItemIdentifier:", [v4 decodeInt64ForKey:@"itemIdentifier"]);
    v7 = [v4 decodeObjectForKey:@"artworks"];
    [(SKUIRedeemItem *)v5 setArtworks:v7];

    -[SKUIItem setItemKind:](v5, "setItemKind:", [v4 decodeIntegerForKey:@"itemKind"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(SKUIItem *)self title];
  [v6 encodeObject:v4 forKey:@"title"];

  objc_msgSend(v6, "encodeInt64:forKey:", -[SKUIItem itemIdentifier](self, "itemIdentifier"), @"itemIdentifier");
  v5 = [(SKUIRedeemItem *)self artworks];
  [v6 encodeObject:v5 forKey:@"artworks"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[SKUIItem itemKind](self, "itemKind"), @"itemKind");
}

- (SKUIArtworkProviding)artworks
{
  return self->_artworks;
}

- (void)setArtworks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
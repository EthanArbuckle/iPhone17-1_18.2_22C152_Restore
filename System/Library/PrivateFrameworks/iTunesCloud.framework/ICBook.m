@interface ICBook
+ (BOOL)supportsSecureCoding;
- (BOOL)isVPPLicensed;
- (ICBook)initWithCoder:(id)a3;
- (NSDate)datePurchased;
- (NSString)author;
- (NSString)genre;
- (NSString)redownloadParameters;
- (NSString)title;
- (NSString)vppOrganizationDisplayName;
- (NSString)vppOrganizationID;
- (NSURL)artworkURL;
- (id)description;
- (unint64_t)purchaseHistoryID;
- (unint64_t)storeID;
- (void)encodeWithCoder:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setDatePurchased:(id)a3;
- (void)setGenre:(id)a3;
- (void)setPurchaseHistoryID:(unint64_t)a3;
- (void)setRedownloadParameters:(id)a3;
- (void)setStoreID:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setVppLicensed:(BOOL)a3;
- (void)setVppOrganizationDisplayName:(id)a3;
- (void)setVppOrganizationID:(id)a3;
@end

@implementation ICBook

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vppOrganizationDisplayName, 0);
  objc_storeStrong((id *)&self->_vppOrganizationID, 0);
  objc_storeStrong((id *)&self->_redownloadParameters, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_datePurchased, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_author, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setVppOrganizationDisplayName:(id)a3
{
}

- (NSString)vppOrganizationDisplayName
{
  return self->_vppOrganizationDisplayName;
}

- (void)setVppOrganizationID:(id)a3
{
}

- (NSString)vppOrganizationID
{
  return self->_vppOrganizationID;
}

- (void)setVppLicensed:(BOOL)a3
{
  self->_vppLicensed = a3;
}

- (BOOL)isVPPLicensed
{
  return self->_vppLicensed;
}

- (void)setRedownloadParameters:(id)a3
{
}

- (NSString)redownloadParameters
{
  return self->_redownloadParameters;
}

- (void)setArtworkURL:(id)a3
{
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setDatePurchased:(id)a3
{
}

- (NSDate)datePurchased
{
  return self->_datePurchased;
}

- (void)setGenre:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setStoreID:(unint64_t)a3
{
  self->_storeID = a3;
}

- (unint64_t)storeID
{
  return self->_storeID;
}

- (void)setPurchaseHistoryID:(unint64_t)a3
{
  self->_purchaseHistoryID = a3;
}

- (unint64_t)purchaseHistoryID
{
  return self->_purchaseHistoryID;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ICBook *)self title];
  v6 = [v3 stringWithFormat:@"<%@: %p title='%@'>", v4, self, v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[ICBook purchaseHistoryID](self, "purchaseHistoryID"), @"ICPurchasedBookPurchaseHistoryID");
  objc_msgSend(v4, "encodeInt64:forKey:", -[ICBook storeID](self, "storeID"), @"ICPurchasedBookStoreID");
  v5 = [(ICBook *)self title];
  [v4 encodeObject:v5 forKey:@"ICPurchasedBookTitle"];

  v6 = [(ICBook *)self author];
  [v4 encodeObject:v6 forKey:@"ICPurchasedBookAuthor"];

  v7 = [(ICBook *)self genre];
  [v4 encodeObject:v7 forKey:@"ICPurchasedBookGenre"];

  v8 = [(ICBook *)self datePurchased];
  [v4 encodeObject:v8 forKey:@"ICPurchasedBookDatePurchased"];

  v9 = [(ICBook *)self artworkURL];
  [v4 encodeObject:v9 forKey:@"ICPurchasedBookArtworkURL"];

  v10 = [(ICBook *)self redownloadParameters];
  [v4 encodeObject:v10 forKey:@"ICPurchasedBookRedownloadParameters"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ICBook isVPPLicensed](self, "isVPPLicensed"), @"ICPurchasedBookVPPLicensed");
  v11 = [(ICBook *)self vppOrganizationID];
  [v4 encodeObject:v11 forKey:@"ICPurchasedBookVPPOrganizationID"];

  id v12 = [(ICBook *)self vppOrganizationDisplayName];
  [v4 encodeObject:v12 forKey:@"ICPurchasedBookVPPOrganizationDisplayName"];
}

- (ICBook)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICBook;
  v5 = [(ICBook *)&v15 init];
  if (v5)
  {
    -[ICBook setPurchaseHistoryID:](v5, "setPurchaseHistoryID:", [v4 decodeInt64ForKey:@"ICPurchasedBookPurchaseHistoryID"]);
    -[ICBook setStoreID:](v5, "setStoreID:", [v4 decodeInt64ForKey:@"ICPurchasedBookStoreID"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICPurchasedBookTitle"];
    [(ICBook *)v5 setTitle:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICPurchasedBookAuthor"];
    [(ICBook *)v5 setAuthor:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICPurchasedBookGenre"];
    [(ICBook *)v5 setGenre:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICPurchasedBookDatePurchased"];
    [(ICBook *)v5 setDatePurchased:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICPurchasedBookArtworkURL"];
    [(ICBook *)v5 setArtworkURL:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICPurchasedBookRedownloadParameters"];
    [(ICBook *)v5 setRedownloadParameters:v11];

    -[ICBook setVppLicensed:](v5, "setVppLicensed:", [v4 decodeBoolForKey:@"ICPurchasedBookVPPLicensed"]);
    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICPurchasedBookVPPOrganizationID"];
    [(ICBook *)v5 setVppOrganizationID:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICPurchasedBookVPPOrganizationDisplayName"];
    [(ICBook *)v5 setVppOrganizationDisplayName:v13];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
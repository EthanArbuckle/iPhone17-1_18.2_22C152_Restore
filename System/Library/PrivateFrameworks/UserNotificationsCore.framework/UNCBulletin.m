@interface UNCBulletin
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (NSString)bulletinID;
- (NSString)dismissalID;
- (NSString)message;
- (NSString)sectionID;
- (NSString)subtitle;
- (NSString)title;
- (NSString)universalSectionID;
- (UNCBulletin)initWithBulletinID:(id)a3 sectionID:(id)a4 universalSectionID:(id)a5 dismissalID:(id)a6 date:(id)a7 title:(id)a8 subtitle:(id)a9 message:(id)a10;
- (UNCBulletin)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNCBulletin

- (UNCBulletin)initWithBulletinID:(id)a3 sectionID:(id)a4 universalSectionID:(id)a5 dismissalID:(id)a6 date:(id)a7 title:(id)a8 subtitle:(id)a9 message:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v42.receiver = self;
  v42.super_class = (Class)UNCBulletin;
  v24 = [(UNCBulletin *)&v42 init];
  if (v24)
  {
    uint64_t v25 = [v16 copy];
    bulletinID = v24->_bulletinID;
    v24->_bulletinID = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    sectionID = v24->_sectionID;
    v24->_sectionID = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    universalSectionID = v24->_universalSectionID;
    v24->_universalSectionID = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    dismissalID = v24->_dismissalID;
    v24->_dismissalID = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    date = v24->_date;
    v24->_date = (NSDate *)v33;

    uint64_t v35 = [v21 copy];
    title = v24->_title;
    v24->_title = (NSString *)v35;

    uint64_t v37 = [v22 copy];
    subtitle = v24->_subtitle;
    v24->_subtitle = (NSString *)v37;

    uint64_t v39 = [v23 copy];
    message = v24->_message;
    v24->_message = (NSString *)v39;
  }
  return v24;
}

- (id)description
{
  v2 = [MEMORY[0x263F29C40] builderWithObject:self];
  v3 = [v2 build];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(UNCBulletin *)self bulletinID];
  v6 = [(UNCBulletin *)self sectionID];
  v7 = [(UNCBulletin *)self universalSectionID];
  v8 = [(UNCBulletin *)self dismissalID];
  v9 = [(UNCBulletin *)self date];
  v10 = [(UNCBulletin *)self title];
  v11 = [(UNCBulletin *)self subtitle];
  v12 = [(UNCBulletin *)self message];
  v13 = (void *)[v4 initWithBulletinID:v5 sectionID:v6 universalSectionID:v7 dismissalID:v8 date:v9 title:v10 subtitle:v11 message:v12];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UNCBulletin *)self bulletinID];
  [v4 encodeObject:v5 forKey:@"bulletinID"];

  v6 = [(UNCBulletin *)self sectionID];
  [v4 encodeObject:v6 forKey:@"sectionID"];

  v7 = [(UNCBulletin *)self universalSectionID];
  [v4 encodeObject:v7 forKey:@"universalSectionID"];

  v8 = [(UNCBulletin *)self date];
  [v4 encodeObject:v8 forKey:@"date"];

  v9 = [(UNCBulletin *)self title];
  [v4 encodeObject:v9 forKey:@"title"];

  v10 = [(UNCBulletin *)self subtitle];
  [v4 encodeObject:v10 forKey:@"subtitle"];

  id v11 = [(UNCBulletin *)self message];
  [v4 encodeObject:v11 forKey:@"message"];
}

- (UNCBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UNCBulletin;
  v5 = [(UNCBulletin *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bulletinID"];
    bulletinID = v5->_bulletinID;
    v5->_bulletinID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionID"];
    sectionID = v5->_sectionID;
    v5->_sectionID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"universalSectionID"];
    universalSectionID = v5->_universalSectionID;
    v5->_universalSectionID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v18;
  }
  return v5;
}

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (NSString)universalSectionID
{
  return self->_universalSectionID;
}

- (NSString)dismissalID
{
  return self->_dismissalID;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dismissalID, 0);
  objc_storeStrong((id *)&self->_universalSectionID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);

  objc_storeStrong((id *)&self->_bulletinID, 0);
}

@end
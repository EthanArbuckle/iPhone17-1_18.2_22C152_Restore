@interface UNCAttachmentRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)hiddenFromDefaultExpandedView;
- (BOOL)isEqual:(id)a3;
- (BOOL)thumbnailHidden;
- (NSDictionary)thumbnailClippingRect;
- (NSDictionary)thumbnailTimestamp;
- (NSNumber)thumbnailFrameNumber;
- (NSString)identifier;
- (NSString)type;
- (NSURL)URL;
- (UNCAttachmentRecord)initWithCoder:(id)a3;
- (UNCAttachmentRecord)initWithDictionaryRepresentation:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHiddenFromDefaultExpandedView:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setThumbnailClippingRect:(id)a3;
- (void)setThumbnailFrameNumber:(id)a3;
- (void)setThumbnailHidden:(BOOL)a3;
- (void)setThumbnailTimestamp:(id)a3;
- (void)setType:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation UNCAttachmentRecord

- (UNCAttachmentRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNCAttachmentRecord;
  v5 = [(UNCAttachmentRecord *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AttachmentIdentifier"];
    [(UNCAttachmentRecord *)v5 setIdentifier:v6];

    v7 = [v4 objectForKey:@"AttachmentURL"];
    [(UNCAttachmentRecord *)v5 setURL:v7];

    v8 = [v4 objectForKey:@"AttachmentType"];
    [(UNCAttachmentRecord *)v5 setType:v8];

    -[UNCAttachmentRecord setThumbnailHidden:](v5, "setThumbnailHidden:", objc_msgSend(v4, "bs_BOOLForKey:", @"AttachmentOptionsThumbnailHidden"));
    v9 = objc_msgSend(v4, "bs_safeDictionaryForKey:", @"AttachmentOptionsThumbnailClippingRect");
    [(UNCAttachmentRecord *)v5 setThumbnailClippingRect:v9];

    v10 = objc_msgSend(v4, "bs_safeNumberForKey:", @"AttachmentOptionsThumbnailFrameNumber");
    [(UNCAttachmentRecord *)v5 setThumbnailFrameNumber:v10];

    v11 = objc_msgSend(v4, "bs_safeDictionaryForKey:", @"AttachmentOptionsThumbnailTimestamp");
    [(UNCAttachmentRecord *)v5 setThumbnailTimestamp:v11];

    -[UNCAttachmentRecord setHiddenFromDefaultExpandedView:](v5, "setHiddenFromDefaultExpandedView:", objc_msgSend(v4, "bs_BOOLForKey:", @"AttachmentHiddenFromDefaultExpandedView"));
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(UNCAttachmentRecord *)self identifier];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, @"AttachmentIdentifier");

  v5 = [(UNCAttachmentRecord *)self URL];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, @"AttachmentURL");

  v6 = [(UNCAttachmentRecord *)self type];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, @"AttachmentType");

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCAttachmentRecord thumbnailHidden](self, "thumbnailHidden"));
  [v3 setObject:v7 forKey:@"AttachmentOptionsThumbnailHidden"];

  v8 = [(UNCAttachmentRecord *)self thumbnailClippingRect];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v8, @"AttachmentOptionsThumbnailClippingRect");

  v9 = [(UNCAttachmentRecord *)self thumbnailFrameNumber];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v9, @"AttachmentOptionsThumbnailFrameNumber");

  v10 = [(UNCAttachmentRecord *)self thumbnailTimestamp];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v10, @"AttachmentOptionsThumbnailTimestamp");

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCAttachmentRecord hiddenFromDefaultExpandedView](self, "hiddenFromDefaultExpandedView"));
  [v3 setObject:v11 forKey:@"AttachmentHiddenFromDefaultExpandedView"];

  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(UNCAttachmentRecord *)self identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"Identifier"];

  v6 = [(UNCAttachmentRecord *)self URL];
  id v7 = (id)[v3 appendObject:v6 withName:@"URL"];

  v8 = [(UNCAttachmentRecord *)self type];
  id v9 = (id)[v3 appendObject:v8 withName:@"Type"];

  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCAttachmentRecord thumbnailHidden](self, "thumbnailHidden"), @"ThumbnailHidden");
  v11 = [(UNCAttachmentRecord *)self thumbnailClippingRect];
  id v12 = (id)[v3 appendObject:v11 withName:@"ThumbnailClippingRect"];

  objc_super v13 = [(UNCAttachmentRecord *)self thumbnailFrameNumber];
  id v14 = (id)[v3 appendObject:v13 withName:@"ThumbnailFrameNumber"];

  v15 = [(UNCAttachmentRecord *)self thumbnailTimestamp];
  id v16 = (id)[v3 appendObject:v15 withName:@"ThumbnailTimestamp"];

  id v17 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCAttachmentRecord hiddenFromDefaultExpandedView](self, "hiddenFromDefaultExpandedView"), @"HiddenFromDefaultExpandedView");
  v18 = [v3 build];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    id v4 = a3;
    objc_opt_class();
    id v5 = UNSafeCast();

    if (v5)
    {
      v6 = [(UNCAttachmentRecord *)self identifier];
      id v7 = [v5 identifier];
      if (UNEqualObjects())
      {
        v8 = [(UNCAttachmentRecord *)self URL];
        id v9 = [v5 URL];
        if (UNEqualObjects())
        {
          id v10 = [(UNCAttachmentRecord *)self type];
          v11 = [v5 type];
          if (UNEqualObjects()
            && (int v12 = [(UNCAttachmentRecord *)self thumbnailHidden],
                v12 == [v5 thumbnailHidden]))
          {
            id v14 = [(UNCAttachmentRecord *)self thumbnailClippingRect];
            v15 = [v5 thumbnailClippingRect];
            if (UNEqualObjects())
            {
              v23 = v14;
              uint64_t v16 = [(UNCAttachmentRecord *)self thumbnailFrameNumber];
              [v5 thumbnailFrameNumber];
              v22 = v24 = (void *)v16;
              if (UNEqualObjects())
              {
                uint64_t v17 = [(UNCAttachmentRecord *)self thumbnailTimestamp];
                v20 = [v5 thumbnailTimestamp];
                v21 = (void *)v17;
                id v14 = v23;
                if (UNEqualObjects())
                {
                  BOOL v18 = [(UNCAttachmentRecord *)self hiddenFromDefaultExpandedView];
                  int v13 = v18 ^ [v5 hiddenFromDefaultExpandedView] ^ 1;
                }
                else
                {
                  LOBYTE(v13) = 0;
                }
              }
              else
              {
                LOBYTE(v13) = 0;
                id v14 = v23;
              }
            }
            else
            {
              LOBYTE(v13) = 0;
            }
          }
          else
          {
            LOBYTE(v13) = 0;
          }
        }
        else
        {
          LOBYTE(v13) = 0;
        }
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = [(UNCAttachmentRecord *)self identifier];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(UNCAttachmentRecord *)self URL];
  id v7 = (id)[v3 appendObject:v6];

  v8 = [(UNCAttachmentRecord *)self type];
  id v9 = (id)[v3 appendObject:v8];

  id v10 = (id)objc_msgSend(v3, "appendBool:", -[UNCAttachmentRecord thumbnailHidden](self, "thumbnailHidden"));
  v11 = [(UNCAttachmentRecord *)self thumbnailClippingRect];
  id v12 = (id)[v3 appendObject:v11];

  int v13 = [(UNCAttachmentRecord *)self thumbnailFrameNumber];
  id v14 = (id)[v3 appendObject:v13];

  v15 = [(UNCAttachmentRecord *)self thumbnailTimestamp];
  id v16 = (id)[v3 appendObject:v15];

  id v17 = (id)objc_msgSend(v3, "appendBool:", -[UNCAttachmentRecord hiddenFromDefaultExpandedView](self, "hiddenFromDefaultExpandedView"));
  unint64_t v18 = [v3 hash];

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCAttachmentRecord *)self dictionaryRepresentation];
  [v4 encodeObject:v5 forKey:@"dictionary"];
}

- (UNCAttachmentRecord)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:7];
  id v7 = objc_msgSend(v4, "setWithArray:", v6, v11, v12, v13, v14, v15, v16);

  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"dictionary"];

  id v9 = [[UNCAttachmentRecord alloc] initWithDictionaryRepresentation:v8];
  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (BOOL)thumbnailHidden
{
  return self->_thumbnailHidden;
}

- (void)setThumbnailHidden:(BOOL)a3
{
  self->_thumbnailHidden = a3;
}

- (NSDictionary)thumbnailClippingRect
{
  return self->_thumbnailClippingRect;
}

- (void)setThumbnailClippingRect:(id)a3
{
}

- (NSNumber)thumbnailFrameNumber
{
  return self->_thumbnailFrameNumber;
}

- (void)setThumbnailFrameNumber:(id)a3
{
}

- (NSDictionary)thumbnailTimestamp
{
  return self->_thumbnailTimestamp;
}

- (void)setThumbnailTimestamp:(id)a3
{
}

- (BOOL)hiddenFromDefaultExpandedView
{
  return self->_hiddenFromDefaultExpandedView;
}

- (void)setHiddenFromDefaultExpandedView:(BOOL)a3
{
  self->_hiddenFromDefaultExpandedView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailTimestamp, 0);
  objc_storeStrong((id *)&self->_thumbnailFrameNumber, 0);
  objc_storeStrong((id *)&self->_thumbnailClippingRect, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
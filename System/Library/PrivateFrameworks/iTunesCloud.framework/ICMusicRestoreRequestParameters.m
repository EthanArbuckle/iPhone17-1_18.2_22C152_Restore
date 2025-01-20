@interface ICMusicRestoreRequestParameters
- (ICMusicRestoreRequestParameters)initWithItemID:(id)a3 title:(id)a4 storeFrontID:(id)a5 mediaKind:(id)a6 accountID:(id)a7 matchStatus:(id)a8 flavor:(id)a9;
- (NSNumber)accountID;
- (NSNumber)adamID;
- (NSNumber)matchStatus;
- (NSString)flavor;
- (NSString)mediaKind;
- (NSString)storeFrontID;
- (NSString)title;
@end

@implementation ICMusicRestoreRequestParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flavor, 0);
  objc_storeStrong((id *)&self->_mediaKind, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_matchStatus, 0);
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong((id *)&self->_adamID, 0);
}

- (NSString)flavor
{
  return self->_flavor;
}

- (NSString)mediaKind
{
  return self->_mediaKind;
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (NSString)title
{
  return self->_title;
}

- (NSNumber)matchStatus
{
  return self->_matchStatus;
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (ICMusicRestoreRequestParameters)initWithItemID:(id)a3 title:(id)a4 storeFrontID:(id)a5 mediaKind:(id)a6 accountID:(id)a7 matchStatus:(id)a8 flavor:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)ICMusicRestoreRequestParameters;
  v18 = [(ICMusicRestoreRequestParameters *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_adamID, a3);
    objc_storeStrong((id *)&v19->_title, a4);
    objc_storeStrong((id *)&v19->_storeFrontID, a5);
    objc_storeStrong((id *)&v19->_mediaKind, a6);
    objc_storeStrong((id *)&v19->_accountID, a7);
    objc_storeStrong((id *)&v19->_matchStatus, a8);
    objc_storeStrong((id *)&v19->_flavor, a9);
  }

  return v19;
}

@end
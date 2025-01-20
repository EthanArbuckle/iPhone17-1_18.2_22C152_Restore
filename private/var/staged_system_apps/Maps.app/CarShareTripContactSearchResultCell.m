@interface CarShareTripContactSearchResultCell
- (id)_contactNameStringFromContact:(id)a3;
- (id)_subtitleString;
- (void)configureWithMSPSharedTripContact:(id)a3;
- (void)setSharingHandle:(id)a3;
@end

@implementation CarShareTripContactSearchResultCell

- (void)setSharingHandle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarShareTripContactSearchResultCell;
  [(CarShareTripContactCell *)&v4 setSharingHandle:a3];
  if (![(CarShareTripContactCell *)self sharingState]) {
    [(CarShareTripContactCell *)self _updateSubtitleLabel];
  }
}

- (id)_contactNameStringFromContact:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 contact];
  if (v4) {
    +[CNContactFormatter stringFromContact:v4 style:0];
  }
  else {
  v5 = [v3 displayName];
  }

  return v5;
}

- (id)_subtitleString
{
  v9.receiver = self;
  v9.super_class = (Class)CarShareTripContactSearchResultCell;
  id v3 = [(CarShareTripContactCell *)&v9 _subtitleString];
  if ([(CarShareTripContactCell *)self sharingState])
  {
    id v4 = v3;
  }
  else
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    v6 = [(CarShareTripContactCell *)self sharingHandle];

    if (v6)
    {
      v7 = [(CarShareTripContactCell *)self sharingHandle];
      [v5 addObject:v7];
    }
    if (v3) {
      [v5 addObject:v3];
    }
    id v4 = [v5 componentsJoinedByString:@" • "];
  }

  return v4;
}

- (void)configureWithMSPSharedTripContact:(id)a3
{
  id v4 = a3;
  [(CarShareTripContactCell *)self setContactValue:v4];
  v5.receiver = self;
  v5.super_class = (Class)CarShareTripContactSearchResultCell;
  [(CarShareTripContactCell *)&v5 configureWithMSPSharedTripContact:v4];
}

@end
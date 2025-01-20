@interface REMReminderCreationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)titleIsGeneratedSuggestion;
- (BOOL)wantsExtendedDetailOnlyView;
- (CLLocation)location;
- (NSAttributedString)notes;
- (NSAttributedString)title;
- (NSData)siriFoundInAppsData;
- (NSDateComponents)dueDateComponents;
- (NSString)locationString;
- (NSURL)url;
- (NSUserActivity)userActivity;
- (REMObjectID)reminderID;
- (REMReminderCreationContext)initWithCoder:(id)a3;
- (REMReminderCreationContext)initWithDelegate:(id)a3;
- (int64_t)locationProximity;
- (void)encodeWithCoder:(id)a3;
- (void)setDueDateComponents:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationProximity:(int64_t)a3;
- (void)setLocationString:(id)a3;
- (void)setNotes:(id)a3;
- (void)setReminderID:(id)a3;
- (void)setSiriFoundInAppsData:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleIsGeneratedSuggestion:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)setUserActivity:(id)a3;
- (void)setWantsExtendedDetailOnlyView:(BOOL)a3;
@end

@implementation REMReminderCreationContext

- (REMReminderCreationContext)initWithDelegate:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)REMReminderCreationContext;
  v5 = [(REMReminderCreationContext *)&v24 init];
  if (v5)
  {
    if (objc_opt_respondsToSelector())
    {
      v6 = [v4 reminderID];
      [(REMReminderCreationContext *)v5 setReminderID:v6];
    }
    v7 = [v4 title];
    [(REMReminderCreationContext *)v5 setTitle:v7];

    v8 = [v4 notes];
    [(REMReminderCreationContext *)v5 setNotes:v8];

    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v4 dueDateComponents], v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      v10 = [v4 dueDateComponents];
      uint64_t v11 = objc_msgSend(v10, "rem_isAllDayDateComponents");
      v12 = [v10 timeZone];
      if (!v12)
      {
        v12 = [MEMORY[0x263EFFA18] localTimeZone];
      }
      v13 = objc_msgSend(MEMORY[0x263EFF918], "rem_dateWithDateComponents:timeZone:", v10, v12);
      if (v13)
      {
        v14 = objc_msgSend(MEMORY[0x263EFF918], "rem_dateComponentsWithDate:timeZone:isAllDay:", v13, v12, v11);
        [(REMReminderCreationContext *)v5 setDueDateComponents:v14];
      }
      else
      {
        [(REMReminderCreationContext *)v5 setDueDateComponents:0];
      }
    }
    else
    {
      [(REMReminderCreationContext *)v5 setDueDateComponents:0];
    }
    v15 = [v4 location];
    [(REMReminderCreationContext *)v5 setLocation:v15];

    v16 = [v4 locationString];
    [(REMReminderCreationContext *)v5 setLocationString:v16];

    v17 = [v4 url];
    [(REMReminderCreationContext *)v5 setUrl:v17];

    v18 = [v4 userActivity];
    [(REMReminderCreationContext *)v5 setUserActivity:v18];

    if (objc_opt_respondsToSelector()) {
      uint64_t v19 = [v4 wantsExtendedDetailOnlyView];
    }
    else {
      uint64_t v19 = 0;
    }
    [(REMReminderCreationContext *)v5 setWantsExtendedDetailOnlyView:v19];
    if (objc_opt_respondsToSelector()) {
      uint64_t v20 = [v4 titleIsGeneratedSuggestion];
    }
    else {
      uint64_t v20 = 0;
    }
    [(REMReminderCreationContext *)v5 setTitleIsGeneratedSuggestion:v20];
    if (objc_opt_respondsToSelector())
    {
      v21 = [v4 siriFoundInAppsData];
      [(REMReminderCreationContext *)v5 setSiriFoundInAppsData:v21];
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v22 = [v4 locationProximity];
    }
    else {
      uint64_t v22 = 0;
    }
    [(REMReminderCreationContext *)v5 setLocationProximity:v22];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  id v4 = [(REMReminderCreationContext *)self reminderID];
  [v16 encodeObject:v4 forKey:@"reminderID"];

  v5 = [(REMReminderCreationContext *)self title];
  [v16 encodeObject:v5 forKey:@"title"];

  v6 = [(REMReminderCreationContext *)self notes];
  [v16 encodeObject:v6 forKey:@"notes"];

  v7 = [(REMReminderCreationContext *)self dueDateComponents];
  [v16 encodeObject:v7 forKey:@"dueDateComponents"];

  v8 = [(REMReminderCreationContext *)self location];
  [v16 encodeObject:v8 forKey:@"location"];

  v9 = [(REMReminderCreationContext *)self locationString];
  [v16 encodeObject:v9 forKey:@"locationString"];

  v10 = [(REMReminderCreationContext *)self url];
  [v16 encodeObject:v10 forKey:@"url"];

  uint64_t v11 = [(REMReminderCreationContext *)self siriFoundInAppsData];
  [v16 encodeObject:v11 forKey:@"siriFoundInAppsData"];

  objc_msgSend(v16, "encodeBool:forKey:", -[REMReminderCreationContext wantsExtendedDetailOnlyView](self, "wantsExtendedDetailOnlyView"), @"wantsExtendedDetailOnlyView");
  objc_msgSend(v16, "encodeBool:forKey:", -[REMReminderCreationContext titleIsGeneratedSuggestion](self, "titleIsGeneratedSuggestion"), @"titleIsGeneratedSuggestion");
  objc_msgSend(v16, "encodeInteger:forKey:", -[REMReminderCreationContext locationProximity](self, "locationProximity"), @"locationProximity");
  v12 = [(REMReminderCreationContext *)self userActivity];

  if (v12)
  {
    v13 = [(REMReminderCreationContext *)self userActivity];
    v14 = (void *)[objc_alloc(MEMORY[0x263F62FA0]) initWithUserActivity:v13];
    v15 = [v14 archivedDictionaryData];
  }
  else
  {
    v15 = 0;
  }
  [v16 encodeObject:v15 forKey:@"userActivity"];
}

- (REMReminderCreationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMReminderCreationContext *)self initWithDelegate:0];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reminderID"];
    [(REMReminderCreationContext *)v5 setReminderID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    [(REMReminderCreationContext *)v5 setTitle:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notes"];
    [(REMReminderCreationContext *)v5 setNotes:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueDateComponents"];
    [(REMReminderCreationContext *)v5 setDueDateComponents:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    [(REMReminderCreationContext *)v5 setLocation:v10];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationString"];
    [(REMReminderCreationContext *)v5 setLocationString:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    [(REMReminderCreationContext *)v5 setUrl:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siriFoundInAppsData"];
    [(REMReminderCreationContext *)v5 setSiriFoundInAppsData:v13];

    -[REMReminderCreationContext setWantsExtendedDetailOnlyView:](v5, "setWantsExtendedDetailOnlyView:", [v4 decodeBoolForKey:@"wantsExtendedDetailOnlyView"]);
    -[REMReminderCreationContext setTitleIsGeneratedSuggestion:](v5, "setTitleIsGeneratedSuggestion:", [v4 decodeBoolForKey:@"titleIsGeneratedSuggestion"]);
    -[REMReminderCreationContext setLocationProximity:](v5, "setLocationProximity:", [v4 decodeIntegerForKey:@"locationProximity"]);
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivity"];
    if (v14)
    {
      v15 = [MEMORY[0x263F62FA0] userActivityWithDictionaryData:v14 error:0];
      id v16 = [v15 userActivity];
      [(REMReminderCreationContext *)v5 setUserActivity:v16];
    }
  }

  return v5;
}

- (REMObjectID)reminderID
{
  return self->_reminderID;
}

- (void)setReminderID:(id)a3
{
}

- (NSAttributedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSAttributedString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (void)setDueDateComponents:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)locationString
{
  return self->_locationString;
}

- (void)setLocationString:(id)a3
{
}

- (int64_t)locationProximity
{
  return self->_locationProximity;
}

- (void)setLocationProximity:(int64_t)a3
{
  self->_locationProximity = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSData)siriFoundInAppsData
{
  return self->_siriFoundInAppsData;
}

- (void)setSiriFoundInAppsData:(id)a3
{
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
}

- (BOOL)wantsExtendedDetailOnlyView
{
  return self->_wantsExtendedDetailOnlyView;
}

- (void)setWantsExtendedDetailOnlyView:(BOOL)a3
{
  self->_wantsExtendedDetailOnlyView = a3;
}

- (BOOL)titleIsGeneratedSuggestion
{
  return self->_titleIsGeneratedSuggestion;
}

- (void)setTitleIsGeneratedSuggestion:(BOOL)a3
{
  self->_titleIsGeneratedSuggestion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_siriFoundInAppsData, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_dueDateComponents, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_reminderID, 0);
}

@end
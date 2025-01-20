@interface WBSettingsTask
+ (id)taskForDeletingAllWebsiteDataInProfileWithIdentifier:(id)a3;
+ (id)taskForDeletingHistoryAfterDate:(id)a3 beforeDate:(id)a4 forProfileIdentifier:(id)a5 clearAllProfiles:(BOOL)a6;
+ (id)taskForDeletingIndividualWebsiteDataWithRecord:(id)a3;
+ (id)taskWithType:(int64_t)a3;
- (BOOL)clearAllProfiles;
- (NSDate)afterDate;
- (NSDate)beforeDate;
- (NSString)profileIdentifier;
- (WBSettingsTask)initWithType:(int64_t)a3 afterDate:(id)a4 beforeDate:(id)a5 profileIdentifier:(id)a6 clearAllProfiles:(BOOL)a7;
- (WBSettingsTask)initWithType:(int64_t)a3 websiteDataRecord:(id)a4 profileIdentifier:(id)a5;
- (WBWebsiteDataRecord)websiteDataRecord;
- (int64_t)taskType;
@end

@implementation WBSettingsTask

+ (id)taskWithType:(int64_t)a3
{
  v3 = [[WBSettingsTask alloc] initWithType:a3 websiteDataRecord:0 profileIdentifier:0];
  return v3;
}

+ (id)taskForDeletingIndividualWebsiteDataWithRecord:(id)a3
{
  id v3 = a3;
  v4 = [[WBSettingsTask alloc] initWithType:1 websiteDataRecord:v3 profileIdentifier:0];

  return v4;
}

+ (id)taskForDeletingAllWebsiteDataInProfileWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[WBSettingsTask alloc] initWithType:0 websiteDataRecord:0 profileIdentifier:v3];

  return v4;
}

+ (id)taskForDeletingHistoryAfterDate:(id)a3 beforeDate:(id)a4 forProfileIdentifier:(id)a5 clearAllProfiles:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [[WBSettingsTask alloc] initWithType:4 afterDate:v11 beforeDate:v10 profileIdentifier:v9 clearAllProfiles:v6];

  return v12;
}

- (WBSettingsTask)initWithType:(int64_t)a3 websiteDataRecord:(id)a4 profileIdentifier:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WBSettingsTask;
  id v11 = [(WBSettingsTask *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_taskType = a3;
    objc_storeStrong((id *)&v11->_websiteDataRecord, a4);
    objc_storeStrong((id *)&v12->_profileIdentifier, a5);
    v13 = v12;
  }

  return v12;
}

- (WBSettingsTask)initWithType:(int64_t)a3 afterDate:(id)a4 beforeDate:(id)a5 profileIdentifier:(id)a6 clearAllProfiles:(BOOL)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WBSettingsTask;
  v16 = [(WBSettingsTask *)&v20 init];
  v17 = v16;
  if (v16)
  {
    v16->_taskType = a3;
    objc_storeStrong((id *)&v16->_afterDate, a4);
    objc_storeStrong((id *)&v17->_beforeDate, a5);
    objc_storeStrong((id *)&v17->_profileIdentifier, a6);
    v17->_clearAllProfiles = a7;
    v18 = v17;
  }

  return v17;
}

- (int64_t)taskType
{
  return self->_taskType;
}

- (WBWebsiteDataRecord)websiteDataRecord
{
  return self->_websiteDataRecord;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (NSDate)afterDate
{
  return self->_afterDate;
}

- (NSDate)beforeDate
{
  return self->_beforeDate;
}

- (BOOL)clearAllProfiles
{
  return self->_clearAllProfiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beforeDate, 0);
  objc_storeStrong((id *)&self->_afterDate, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_websiteDataRecord, 0);
}

@end
@interface PXSharedLibraryMockDataSourceManager
+ (PXSharedLibraryMockDataSourceManager)invitationsDataSourceManager;
+ (PXSharedLibraryMockDataSourceManager)ownerExitingDataSourceManager;
+ (PXSharedLibraryMockDataSourceManager)ownerPreviewDataSourceManager;
+ (PXSharedLibraryMockDataSourceManager)ownerSharedLibraryDataSourceManager;
+ (PXSharedLibraryMockDataSourceManager)participantExitingDataSourceManager;
+ (PXSharedLibraryMockDataSourceManager)participantPreviewDataSourceManager;
+ (PXSharedLibraryMockDataSourceManager)participantSharedLibraryDataSourceManager;
+ (id)_sharedLibraryMockWithType:(int64_t)a3;
- (PXSharedLibraryMockDataSourceManager)init;
- (PXSharedLibraryMockDataSourceManager)initWithDataSourceType:(int64_t)a3;
- (id)createInitialDataSource;
- (id)fetchExiting;
- (id)fetchPreview;
- (id)fetchSharedLibrary;
- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4;
@end

@implementation PXSharedLibraryMockDataSourceManager

- (id)createInitialDataSource
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _sharedLibraryMockWithType:self->_type];
  v3 = [PXSharedLibraryMockDataSource alloc];
  v7[0] = v2;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [(PXSharedLibraryMockDataSource *)v3 initWithMocks:v4];

  return v5;
}

- (id)fetchExiting
{
  if ((unint64_t)(self->_type - 7) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXSharedLibraryMockDataSource.m", 166, @"Invalid parameter not satisfying: %@", @"_type == _PXSharedLibraryMockDataSourceTypeExitingOwner || _type == _PXSharedLibraryMockDataSourceTypeExitingParticipant" object file lineNumber description];
  }
  v3 = objc_opt_class();
  int64_t type = self->_type;
  return (id)[v3 _sharedLibraryMockWithType:type];
}

- (id)fetchSharedLibrary
{
  if ((unint64_t)(self->_type - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXSharedLibraryMockDataSource.m", 159, @"Invalid parameter not satisfying: %@", @"(_type == _PXSharedLibraryMockDataSourceTypeSharedLibraryOwner) || (_type == _PXSharedLibraryMockDataSourceTypeSharedLibraryParticipant)" object file lineNumber description];
  }
  v3 = objc_opt_class();
  int64_t type = self->_type;
  return (id)[v3 _sharedLibraryMockWithType:type];
}

- (id)fetchPreview
{
  if ((unint64_t)(self->_type - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXSharedLibraryMockDataSource.m", 152, @"Invalid parameter not satisfying: %@", @"(_type == _PXSharedLibraryMockDataSourceTypePreviewOwner) || (_type == _PXSharedLibraryMockDataSourceTypePreviewParticipant)" object file lineNumber description];
  }
  v3 = objc_opt_class();
  int64_t type = self->_type;
  return (id)[v3 _sharedLibraryMockWithType:type];
}

- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSharedLibraryMockDataSource.m", 144, @"Invalid parameter not satisfying: %@", @"shareURL" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryMockDataSource.m", 145, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v8 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, @"Failed to shared library for URL in the PXSharedLibraryMockDataSourceManager");
  v7[2](v7, 0, v8);
}

- (PXSharedLibraryMockDataSourceManager)initWithDataSourceType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXSharedLibraryMockDataSourceManager;
  result = [(PXSectionedDataSourceManager *)&v5 init];
  if (result) {
    result->_int64_t type = a3;
  }
  return result;
}

- (PXSharedLibraryMockDataSourceManager)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryMockDataSource.m", 87, @"%s is not available as initializer", "-[PXSharedLibraryMockDataSourceManager init]");

  abort();
}

+ (id)_sharedLibraryMockWithType:(int64_t)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(PXSharedLibraryMock);
  objc_super v5 = v4;
  switch(a3)
  {
    case 0:
    case 4:
      goto LABEL_5;
    case 1:
      [(PXSharedLibraryMock *)v4 setIsInPreview:1];
      goto LABEL_7;
    case 2:
      [(PXSharedLibraryMock *)v4 setIsInPreview:1];
      break;
    case 3:
      [(PXSharedLibraryMock *)v4 setIsOwned:1];
LABEL_5:
      [(PXSharedLibraryMock *)v5 setIsPublished:1];
      break;
    case 5:
      [(PXSharedLibraryMock *)v4 setIsPublished:1];
      [(PXSharedLibraryMock *)v5 setIsExiting:1];
LABEL_7:
      [(PXSharedLibraryMock *)v5 setIsOwned:1];
      break;
    case 6:
      [(PXSharedLibraryMock *)v4 setIsPublished:1];
      [(PXSharedLibraryMock *)v5 setIsExiting:1];
      break;
    default:
      break;
  }
  v6 = objc_alloc_init(PXSharedLibraryMockParticipant);
  [(PXSharedLibraryMockParticipant *)v6 setEmailAddress:@"owner.doe@email.com"];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  [v7 setGivenName:@"Sender"];
  [v7 setFamilyName:@"Doe"];
  [(PXSharedLibraryMockParticipant *)v6 setNameComponents:v7];
  [(PXSharedLibraryMockParticipant *)v6 setIsCurrentUser:[(PXSharedLibraryMock *)v5 isOwned]];
  v8 = objc_alloc_init(PXSharedLibraryMockParticipant);
  [(PXSharedLibraryMockParticipant *)v8 setEmailAddress:@"receiver.doe@email.com"];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  [v9 setGivenName:@"Receiver"];
  [v9 setFamilyName:@"Doe"];
  [(PXSharedLibraryMockParticipant *)v8 setNameComponents:v9];
  [(PXSharedLibraryMockParticipant *)v8 setIsCurrentUser:[(PXSharedLibraryMock *)v5 isOwned] ^ 1];
  [(PXSharedLibraryMock *)v5 setOwner:v6];
  v14[0] = v6;
  v14[1] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [(PXSharedLibraryMock *)v5 setParticipants:v10];

  id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
  v12 = +[PXSharedLibraryRule customizedRuleWithStartDate:v11 personUUIDs:&unk_1F02D3B98];
  [(PXSharedLibraryMock *)v5 setRule:v12];

  return v5;
}

+ (PXSharedLibraryMockDataSourceManager)participantExitingDataSourceManager
{
  v2 = (void *)[objc_alloc((Class)a1) initWithDataSourceType:6];
  return (PXSharedLibraryMockDataSourceManager *)v2;
}

+ (PXSharedLibraryMockDataSourceManager)ownerExitingDataSourceManager
{
  v2 = (void *)[objc_alloc((Class)a1) initWithDataSourceType:5];
  return (PXSharedLibraryMockDataSourceManager *)v2;
}

+ (PXSharedLibraryMockDataSourceManager)participantSharedLibraryDataSourceManager
{
  v2 = (void *)[objc_alloc((Class)a1) initWithDataSourceType:4];
  return (PXSharedLibraryMockDataSourceManager *)v2;
}

+ (PXSharedLibraryMockDataSourceManager)ownerSharedLibraryDataSourceManager
{
  v2 = (void *)[objc_alloc((Class)a1) initWithDataSourceType:3];
  return (PXSharedLibraryMockDataSourceManager *)v2;
}

+ (PXSharedLibraryMockDataSourceManager)participantPreviewDataSourceManager
{
  v2 = (void *)[objc_alloc((Class)a1) initWithDataSourceType:2];
  return (PXSharedLibraryMockDataSourceManager *)v2;
}

+ (PXSharedLibraryMockDataSourceManager)ownerPreviewDataSourceManager
{
  v2 = (void *)[objc_alloc((Class)a1) initWithDataSourceType:1];
  return (PXSharedLibraryMockDataSourceManager *)v2;
}

+ (PXSharedLibraryMockDataSourceManager)invitationsDataSourceManager
{
  v2 = (void *)[objc_alloc((Class)a1) initWithDataSourceType:0];
  return (PXSharedLibraryMockDataSourceManager *)v2;
}

@end
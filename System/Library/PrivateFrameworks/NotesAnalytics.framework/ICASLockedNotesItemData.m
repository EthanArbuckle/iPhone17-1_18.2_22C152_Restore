@interface ICASLockedNotesItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASLockedNotesItemData)initWithTotalCountOfV1LockedNotes:(id)a3 totalCountOfV2LockedNotes:(id)a4 totalCountOfLockedNotesWithDivergedMode:(id)a5 totalCountOfLockedNotesWithDivergedPassword:(id)a6;
- (NSNumber)totalCountOfLockedNotesWithDivergedMode;
- (NSNumber)totalCountOfLockedNotesWithDivergedPassword;
- (NSNumber)totalCountOfV1LockedNotes;
- (NSNumber)totalCountOfV2LockedNotes;
- (id)toDict;
@end

@implementation ICASLockedNotesItemData

- (ICASLockedNotesItemData)initWithTotalCountOfV1LockedNotes:(id)a3 totalCountOfV2LockedNotes:(id)a4 totalCountOfLockedNotesWithDivergedMode:(id)a5 totalCountOfLockedNotesWithDivergedPassword:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASLockedNotesItemData;
  v15 = [(ICASLockedNotesItemData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_totalCountOfV1LockedNotes, a3);
    objc_storeStrong((id *)&v16->_totalCountOfV2LockedNotes, a4);
    objc_storeStrong((id *)&v16->_totalCountOfLockedNotesWithDivergedMode, a5);
    objc_storeStrong((id *)&v16->_totalCountOfLockedNotesWithDivergedPassword, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)@"LockedNotesItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"totalCountOfV1LockedNotes";
  v3 = [(ICASLockedNotesItemData *)self totalCountOfV1LockedNotes];
  if (v3)
  {
    uint64_t v4 = [(ICASLockedNotesItemData *)self totalCountOfV1LockedNotes];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = @"totalCountOfV2LockedNotes";
  v6 = [(ICASLockedNotesItemData *)self totalCountOfV2LockedNotes];
  if (v6)
  {
    uint64_t v7 = [(ICASLockedNotesItemData *)self totalCountOfV2LockedNotes];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = @"totalCountOfLockedNotesWithDivergedMode";
  v9 = [(ICASLockedNotesItemData *)self totalCountOfLockedNotesWithDivergedMode];
  if (v9)
  {
    uint64_t v10 = [(ICASLockedNotesItemData *)self totalCountOfLockedNotesWithDivergedMode];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = @"totalCountOfLockedNotesWithDivergedPassword";
  id v12 = [(ICASLockedNotesItemData *)self totalCountOfLockedNotesWithDivergedPassword];
  if (v12)
  {
    uint64_t v13 = [(ICASLockedNotesItemData *)self totalCountOfLockedNotesWithDivergedPassword];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v14 = (void *)v13;
  v18[3] = v13;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (NSNumber)totalCountOfV1LockedNotes
{
  return self->_totalCountOfV1LockedNotes;
}

- (NSNumber)totalCountOfV2LockedNotes
{
  return self->_totalCountOfV2LockedNotes;
}

- (NSNumber)totalCountOfLockedNotesWithDivergedMode
{
  return self->_totalCountOfLockedNotesWithDivergedMode;
}

- (NSNumber)totalCountOfLockedNotesWithDivergedPassword
{
  return self->_totalCountOfLockedNotesWithDivergedPassword;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalCountOfLockedNotesWithDivergedPassword, 0);
  objc_storeStrong((id *)&self->_totalCountOfLockedNotesWithDivergedMode, 0);
  objc_storeStrong((id *)&self->_totalCountOfV2LockedNotes, 0);
  objc_storeStrong((id *)&self->_totalCountOfV1LockedNotes, 0);
}

@end
@interface PGSharedLibraryStartQuestion
- (PGSharedLibraryStartQuestion)init;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGSharedLibraryStartQuestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (unsigned)state
{
  return self->_state;
}

- (double)localFactoryScore
{
  return self->_localFactoryScore;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (unsigned)entityType
{
  return 4;
}

- (unsigned)displayType
{
  return 6;
}

- (unsigned)type
{
  return 21;
}

- (PGSharedLibraryStartQuestion)init
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PGSharedLibraryStartQuestion;
  v2 = [(PGSharedLibraryStartQuestion *)&v8 init];
  v3 = v2;
  if (v2)
  {
    entityIdentifier = v2->_entityIdentifier;
    v2->_entityIdentifier = (NSString *)@"SharedLibraryStartQuestion";

    v3->_localFactoryScore = 1.0;
    v3->_state = 0;
    uint64_t v9 = *MEMORY[0x1E4F8E940];
    v10[0] = @"?";
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    additionalInfo = v3->_additionalInfo;
    v3->_additionalInfo = (NSDictionary *)v5;
  }
  return v3;
}

@end
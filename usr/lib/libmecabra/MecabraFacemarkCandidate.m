@interface MecabraFacemarkCandidate
+ (id)candidateWithString:(id)a3 category:(id)a4;
+ (id)copyFacemarkCandidatesForLanguage:(int)a3;
+ (id)copyFacemarkCandidatesForLocale:(id)a3;
- (MecabraFacemarkCandidate)initWithString:(id)a3 category:(id)a4;
- (NSString)category;
- (NSString)string;
- (id)description;
- (id)surface;
- (void)dealloc;
@end

@implementation MecabraFacemarkCandidate

- (MecabraFacemarkCandidate)initWithString:(id)a3 category:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MecabraFacemarkCandidate;
  v6 = [(MecabraFacemarkCandidate *)&v12 init];
  v6->_string = [(NSString *)[a3 copyWithZone:v7] stringByAppendingString:v8];
  v6->_category = [(NSString *)[a4 copyWithZone:v9] stringByAppendingString:v10];
  return v6;
}

+ (id)candidateWithString:(id)a3 category:(id)a4
{
  id v6 = objc_alloc((Class)a1);
  uint64_t v8 = [v6 initWithString:v7 category:(uint64_t)a3];

  return v8;
}

- (id)surface
{
  return self->_string;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ (%@)", self->_string, self->_category];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MecabraFacemarkCandidate;
  [(MecabraFacemarkCandidate *)&v3 dealloc];
}

+ (id)copyFacemarkCandidatesForLocale:(id)a3
{
  CFComparisonResult v4 = sub_2161E2874((const __CFLocale *)a3);

  return (id)MEMORY[0x270F9A6D0](a1, sel_copyFacemarkCandidatesForLanguage_, v4);
}

+ (id)copyFacemarkCandidatesForLanguage:(int)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if ((a3 - 1) < 2 || a3 == 5) {
    unint64_t v4 = 3;
  }
  else {
    unint64_t v4 = a3;
  }
  v5 = (uint64_t *)sub_2162D8C20();
  id v6 = sub_2162D8CB8(v5, v4, off_26797C900[0], off_26797C868[0]);
  uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
  if (*((char *)v6 + 23) >= 0) {
    uint64_t v9 = [NSString stringWithCString:v7 encoding:v6];
  }
  else {
    uint64_t v9 = [NSString stringWithCString:v7 encoding:4];
  }
  uint64_t v11 = [v8 arrayWithContentsOfFile:v10];
  if (!v11) {
    return 0;
  }
  objc_super v12 = (void *)v11;
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v15 = [v12 countByEnumeratingWithState:v14 objects:(void *)&v29 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v12);
        }
        v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v21 = [v20 objectForKey:v16];
        uint64_t v23 = [v20 objectForKey:v22];
        v24 = [MecabraFacemarkCandidate alloc];
        v26 = [v24 initWithString:v25 category:v21];
        [v13 addObject:(id)v27];
      }
      uint64_t v17 = [v12 countByEnumeratingWithState:v16 objects:v33 count:16];
    }
    while (v17);
  }
  return v13;
}

- (NSString)string
{
  return self->_string;
}

- (NSString)category
{
  return self->_category;
}

@end
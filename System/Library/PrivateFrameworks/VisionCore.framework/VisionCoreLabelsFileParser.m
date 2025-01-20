@interface VisionCoreLabelsFileParser
+ (BOOL)isValidLabel:(id)a3;
+ (BOOL)parseLabels:(id *)a3 fromContentsOfURL:(id)a4 invalidLabelPlaceholderObject:(id)a5 validLabelIndexes:(id *)a6 error:(id *)a7;
@end

@implementation VisionCoreLabelsFileParser

+ (BOOL)parseLabels:(id *)a3 fromContentsOfURL:(id)a4 invalidLabelPlaceholderObject:(id)a5 validLabelIndexes:(id *)a6 error:(id *)a7
{
  v38[19] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v31 = v9;
  if (![v31 fileSystemRepresentation])
  {
    if (a7)
    {
      v25 = [NSString stringWithFormat:@"unable to open %@", v31];
      *a7 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v25];
    }
    BOOL v20 = 0;
    goto LABEL_42;
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v32 = objc_alloc_init(MEMORY[0x263F089C8]);
  memset(&v33, 0, sizeof(v33));
  std::ifstream::basic_ifstream(v35);
  uint64_t v12 = 0;
  v13 = (std::locale::id *)MEMORY[0x263F8C108];
  while (2)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v35 + *(void *)(v35[0] - 24)));
    v14 = std::locale::use_facet(&v34, v13);
    unsigned __int8 v15 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v14->__vftable[2].~facet_0)(v14, 10);
    std::locale::~locale(&v34);
    MEMORY[0x230F41360](&v34, v35, 1);
    if (!LOBYTE(v34.__locale_)) {
      goto LABEL_20;
    }
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    {
      *v33.__r_.__value_.__l.__data_ = 0;
      v33.__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      v33.__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&v33.__r_.__value_.__s + 23) = 0;
    }
    uint64_t v16 = 0;
    while (1)
    {
      v17 = *(void **)&v37[*(void *)(v35[0] - 24) + 4];
      v18 = (unsigned char *)v17[3];
      if (v18 != (unsigned char *)v17[4])
      {
        v17[3] = v18 + 1;
        LOBYTE(v17) = *v18;
        goto LABEL_11;
      }
      LODWORD(v17) = (*(uint64_t (**)(void *))(*v17 + 80))(v17);
      if (v17 == -1) {
        break;
      }
LABEL_11:
      if (v15 == v17)
      {
        int v19 = 0;
        goto LABEL_19;
      }
      std::string::push_back(&v33, (std::string::value_type)v17);
      ++v16;
      if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0 && v33.__r_.__value_.__l.__size_ == 0x7FFFFFFFFFFFFFF7)
      {
        int v19 = 4;
        goto LABEL_19;
      }
    }
    if (v16) {
      int v19 = 2;
    }
    else {
      int v19 = 6;
    }
LABEL_19:
    std::ios_base::clear((std::ios_base *)((char *)v35 + *(void *)(v35[0] - 24)), *(_DWORD *)&v36[*(void *)(v35[0] - 24) + 16] | v19);
LABEL_20:
    BOOL v20 = (*(_DWORD *)&v36[*(void *)(v35[0] - 24) + 16] & 5) != 0;
    if ((*(_DWORD *)&v36[*(void *)(v35[0] - 24) + 16] & 5) != 0)
    {
      if (a3) {
        *a3 = (id)[v11 copy];
      }
      if (a6) {
        *a6 = (id)[v32 copy];
      }
    }
    else
    {
      id v21 = [NSString alloc];
      if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v22 = &v33;
      }
      else {
        v22 = (std::string *)v33.__r_.__value_.__r.__words[0];
      }
      v23 = (void *)[v21 initWithUTF8String:v22];
      if ([a1 isValidLabel:v23])
      {
        [v32 addIndex:v12];
LABEL_28:
        [v11 addObject:v23];

        ++v12;
        continue;
      }
      if (v10)
      {
        id v24 = v10;

        v23 = v24;
        goto LABEL_28;
      }
      if (a7)
      {
        v26 = [NSString stringWithFormat:@"Line %lu of %@ contains an invalid label of \"%@\"", v12 + 1, v31, v23, v37];
        *a7 = [MEMORY[0x263F087E8] VisionCoreErrorForCorruptedResourceWithLocalizedDescription:v26];
      }
    }
    break;
  }
  v35[0] = *MEMORY[0x263F8C2A8];
  *(uint64_t *)((char *)v35 + *(void *)(v35[0] - 24)) = *(void *)(MEMORY[0x263F8C2A8] + 24);
  MEMORY[0x230F41350](v36);
  std::istream::~istream();
  MEMORY[0x230F413B0](v38);
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v33.__r_.__value_.__l.__data_);
  }

LABEL_42:
  return v20;
}

+ (BOOL)isValidLabel:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 length]) {
      int v5 = [v4 hasPrefix:@"CVML_UNKNOWN_"] ^ 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

@end
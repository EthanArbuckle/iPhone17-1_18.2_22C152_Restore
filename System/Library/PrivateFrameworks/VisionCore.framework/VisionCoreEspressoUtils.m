@interface VisionCoreEspressoUtils
+ (BOOL)getInputImageTensorDescriptor:(id *)a3 outputTensorDescriptors:(id *)a4 forNetworkModelFileURL:(id)a5 inputBlobName:(id)a6 pixelFormatType:(unsigned int)a7 outputBlobNamesWithTypes:(id)a8 confidencesBlobNamesWithLabelsFiles:(id)a9 error:(id *)a10;
+ (id)E5RTBaseModelName:(id)a3 error:(id *)a4;
+ (id)E5RTURLForModelBundle:(id)a3 modelFileIsBaseName:(BOOL)a4 error:(id *)a5;
+ (id)E5RTURLForModelNamed:(id)a3 error:(id *)a4;
+ (id)URLForModelNamed:(id)a3 error:(id *)a4;
+ (id)URLForResourceFileNamed:(id)a3 error:(id *)a4;
+ (id)tensorShapesForBlobNames:(id)a3 ofNetworkModelFileURL:(id)a4 error:(id *)a5;
@end

@implementation VisionCoreEspressoUtils

+ (id)URLForModelNamed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = VisionCoreFrameworkBundle();
  if (v6)
  {
    if ([v5 hasSuffix:@".espresso.net"])
    {
      uint64_t v7 = [v5 stringByDeletingPathExtension];

      id v5 = (id)v7;
    }
    v8 = [v6 URLForResource:v5 withExtension:@"net"];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else if (a4)
    {
      v11 = (void *)[[NSString alloc] initWithFormat:@"Could not locate model named \"%@\"", v5];
      *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v11];
    }
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:@"could not locate VisionCore.framework"];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)tensorShapesForBlobNames:(id)a3 ofNetworkModelFileURL:(id)a4 error:(id *)a5
{
  v53[19] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v40 = a4;
  id v41 = [v40 VisionCoreFileSystemPathAndReturnError:a5];
  if (!v41)
  {
    a5 = 0;
    goto LABEL_45;
  }
  uint64_t v8 = [v7 count];
  v39 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:40 * v8];
  uint64_t v9 = [v39 mutableBytes];
  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v11 = 0;
    v12 = (void *)v9;
    do
    {
      id v13 = [v7 objectAtIndexedSubscript:v11];
      void *v12 = [v13 UTF8String];
      v12 += 5;

      ++v11;
    }
    while (v8 != v11);
  }
  id v14 = v41;
  std::string::basic_string[abi:ne180100]<0>(&v50, (char *)[v14 UTF8String]);
  std::string::size_type size = HIBYTE(v50.__r_.__value_.__r.__words[2]);
  v16 = (std::string *)v50.__r_.__value_.__r.__words[0];
  if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v50.__r_.__value_.__l.__size_;
  }
  else {
    v16 = &v50;
  }
  if (!size)
  {
    char v23 = 0;
    uint64_t v24 = 4294967290;
    goto LABEL_26;
  }
  v17 = (std::string *)((char *)v16 + size);
  v18 = v16;
  v19 = v17;
  do
  {
    if (v18->__r_.__value_.__s.__data_[0] == 46)
    {
      uint64_t v20 = 1u;
      while (v20 != 13)
      {
        if ((std::string *)((char *)v18 + v20) == v17) {
          goto LABEL_19;
        }
        int v21 = v18->__r_.__value_.__s.__data_[v20];
        int v22 = aEspressoNet[v20++];
        if (v21 != v22) {
          goto LABEL_11;
        }
      }
      v19 = v18;
    }
LABEL_11:
    v18 = (std::string *)((char *)v18 + 1);
  }
  while (v18 != v17);
LABEL_19:
  char v23 = 0;
  uint64_t v24 = 4294967290;
  if (v19 == v17 || (int64_t v25 = (char *)v19 - (char *)v16, v25 == -1))
  {
LABEL_26:
    if ((*((unsigned char *)&v50.__r_.__value_.__s + 23) & 0x80) != 0) {
      goto LABEL_41;
    }
LABEL_27:
    if ((v23 & 1) == 0) {
      goto LABEL_42;
    }
LABEL_28:
    a5 = (id *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v8];
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v27 = *(void *)(v10 + 32);
        long long v28 = *(_OWORD *)(v10 + 16);
        v42[0] = *(_OWORD *)v10;
        v42[1] = v28;
        uint64_t v43 = v27;
        v29 = +[VisionCoreEspressoTensorShape shapeForBlobDimensions:v42];
        v30 = [v7 objectAtIndexedSubscript:i];
        [a5 setObject:v29 forKey:v30];

        v10 += 40;
      }
    }
    goto LABEL_44;
  }
  std::string::replace(&v50, v25 + 10, 0xFFFFFFFFFFFFFFFFLL, "shape", 5uLL);
  std::ifstream::basic_ifstream(v51);
  std::string::basic_string[abi:ne180100]<0>(__p, "json");
  Espresso::load_network_shape();
  if (v45 < 0)
  {
    operator delete(__p[0]);
    if (!v8) {
      goto LABEL_40;
    }
  }
  else if (!v8)
  {
    goto LABEL_40;
  }
  uint64_t v31 = v10;
  uint64_t v32 = v8;
  do
  {
    *(_OWORD *)(v31 + 24) = 0u;
    *(_OWORD *)(v31 + 8) = 0u;
    std::string::basic_string[abi:ne180100]<0>(__p, *(char **)v31);
    v33 = (char **)std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>((uint64_t)v46, __p);
    if (&v47 != v33
      || (v33 = (char **)std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>((uint64_t)&v48, __p), &v49 != v33))
    {
      v34 = v33[7];
      *(void *)&long long v35 = (int)v34;
      *((void *)&v35 + 1) = SHIDWORD(v34);
      *(_OWORD *)(v31 + 8) = v35;
      v36 = v33[8];
      *(void *)&long long v35 = (int)v36;
      *((void *)&v35 + 1) = SHIDWORD(v36);
      *(_OWORD *)(v31 + 24) = v35;
    }
    if (v45 < 0) {
      operator delete(__p[0]);
    }
    v31 += 40;
    --v32;
  }
  while (v32);
LABEL_40:
  std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(v49);
  std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(v47);
  v51[0] = *MEMORY[0x263F8C2A8];
  *(uint64_t *)((char *)v51 + *(void *)(v51[0] - 24)) = *(void *)(MEMORY[0x263F8C2A8] + 24);
  MEMORY[0x230F41350](&v52);
  std::istream::~istream();
  MEMORY[0x230F413B0](v53);
  uint64_t v24 = 0;
  char v23 = 1;
  if ((*((unsigned char *)&v50.__r_.__value_.__s + 23) & 0x80) == 0) {
    goto LABEL_27;
  }
LABEL_41:
  operator delete(v50.__r_.__value_.__l.__data_);
  if (v23) {
    goto LABEL_28;
  }
LABEL_42:
  if (a5)
  {
    v37 = (void *)[[NSString alloc] initWithFormat:@"unable to introspect %@", v14];
    *a5 = [MEMORY[0x263F087E8] VisionCoreErrorForEspressoReturnStatus:v24 localizedDescription:v37];

    a5 = 0;
  }
LABEL_44:

LABEL_45:
  return a5;
}

+ (BOOL)getInputImageTensorDescriptor:(id *)a3 outputTensorDescriptors:(id *)a4 forNetworkModelFileURL:(id)a5 inputBlobName:(id)a6 pixelFormatType:(unsigned int)a7 outputBlobNamesWithTypes:(id)a8 confidencesBlobNamesWithLabelsFiles:(id)a9 error:(id *)a10
{
  uint64_t v11 = *(void *)&a7;
  uint64_t v58 = *MEMORY[0x263EF8340];
  v47 = (NSURL *)a5;
  std::string v50 = (NSString *)a6;
  id v15 = a8;
  id v49 = a9;
  uint64_t v43 = v15;
  id v16 = objc_alloc(MEMORY[0x263EFF980]);
  v17 = [v15 allKeys];
  uint64_t v48 = (void *)[v16 initWithArray:v17];

  if (v50) {
    [v48 addObject:v50];
  }
  if (v49)
  {
    v18 = [v49 allKeys];
    [v48 addObjectsFromArray:v18];
  }
  char v45 = objc_msgSend(a1, "tensorShapesForBlobNames:ofNetworkModelFileURL:error:", v48, v47);
  if (!v45) {
    goto LABEL_28;
  }
  if (!v50)
  {
    *a3 = 0;
    goto LABEL_10;
  }
  v19 = objc_msgSend(v45, "objectForKeyedSubscript:");
  if (!v19)
  {
    if (a10)
    {
      _noBlobInNetworkModelError(v47, v50);
      BOOL v36 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
LABEL_28:
    BOOL v36 = 0;
    goto LABEL_37;
  }
  *a3 = -[VisionCoreImageTensorDescriptor initWithName:pixelFormatType:pixelWidth:pixelHeight:]([VisionCoreImageTensorDescriptor alloc], "initWithName:pixelFormatType:pixelWidth:pixelHeight:", v50, v11, [v19 width], objc_msgSend(v19, "height"));

LABEL_10:
  id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v21 = v15;
  id v22 = v45;
  self;
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __83__VisionCoreEspressoUtils__addNewTensorDescriptorsTo_forBlobNamesWithTypes_shapes___block_invoke;
  v55[3] = &unk_26488B190;
  id v23 = v22;
  id v56 = v23;
  id v41 = v20;
  id v57 = v41;
  [v21 enumerateKeysAndObjectsUsingBlock:v55];

  if (!v49) {
    goto LABEL_25;
  }
  id v44 = v41;
  id v24 = v49;
  id v46 = v23;
  v39 = v47;
  self;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = [v24 allKeys];
  uint64_t v25 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (!v25) {
    goto LABEL_24;
  }
  uint64_t v26 = *(void *)v52;
  while (2)
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v52 != v26) {
        objc_enumerationMutation(obj);
      }
      long long v28 = *(NSString **)(*((void *)&v51 + 1) + 8 * i);
      v29 = [v46 objectForKeyedSubscript:v28];
      if (!v29)
      {
        if (a10)
        {
          _noBlobInNetworkModelError(v39, v28);
          *a10 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_35;
      }
      id v30 = [v24 objectForKeyedSubscript:v28];
      uint64_t v31 = self;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v32 = v30;
        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a10)
        {
          v37 = (void *)[[NSString alloc] initWithFormat:@"cannot resolve %@ into a file URL", v30];
          *a10 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v37];
        }
LABEL_34:

LABEL_35:
        BOOL v36 = 0;
        long long v35 = v41;
        goto LABEL_36;
      }
      id v32 = [v31 URLForResourceFileNamed:v30 error:a10];
LABEL_21:
      v33 = v32;

      if (!v33) {
        goto LABEL_34;
      }
      v34 = [[VisionCoreLabeledConfidencesDescriptor alloc] initWithName:v28 dataType:65568 shape:v29 strides:0 labelsFileURL:v33];
      [v44 setObject:v34 forKeyedSubscript:v28];
    }
    uint64_t v25 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v25) {
      continue;
    }
    break;
  }
LABEL_24:

LABEL_25:
  long long v35 = v41;
  *a4 = v41;
  BOOL v36 = 1;
LABEL_36:

LABEL_37:
  return v36;
}

void __83__VisionCoreEspressoUtils__addNewTensorDescriptorsTo_forBlobNamesWithTypes_shapes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  uint64_t v7 = [v5 asVisionCoreTensorDataType];
  if ((unint64_t)(v7 - 983048) <= 0x18 && ((1 << (v7 - 8)) & 0x1000101) != 0)
  {
    uint64_t v8 = [VisionCoreImageTensorDescriptor alloc];
    switch(v7)
    {
      case 983048:
        uint64_t v9 = 8;
        break;
      case 983072:
        uint64_t v9 = 1278226534;
        break;
      case 983056:
        uint64_t v9 = 1278226536;
        break;
      default:
        uint64_t v9 = 0;
        break;
    }
    uint64_t v10 = -[VisionCoreImageTensorDescriptor initWithName:pixelFormatType:pixelWidth:pixelHeight:](v8, "initWithName:pixelFormatType:pixelWidth:pixelHeight:", v12, v9, [v6 width], objc_msgSend(v6, "height"));
  }
  else
  {
    uint64_t v10 = [[VisionCoreTensorDescriptor alloc] initWithName:v12 dataType:v7 shape:v6 strides:0];
  }
  uint64_t v11 = v10;
  if (v10) {
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v12];
  }
}

+ (id)E5RTURLForModelNamed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = VisionCoreFrameworkBundle();
  if (v6)
  {
    if ([v5 hasSuffix:@".mil"])
    {
      uint64_t v7 = @"mil";
      goto LABEL_8;
    }
    if ([v5 hasSuffix:@".net"])
    {
      uint64_t v7 = @"net";
LABEL_8:
      uint64_t v9 = [v5 stringByDeletingPathExtension];

      uint64_t v10 = [v6 URLForResource:v9 withExtension:v7];
      if (v10)
      {
        id v11 = v10;
        id v5 = (id)v9;
        uint64_t v8 = v11;
      }
      else
      {
        if (a4)
        {
          id v12 = (void *)[[NSString alloc] initWithFormat:@"Could not locate model named \"%@\"", v9];
          *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v12];
        }
        id v11 = 0;
        uint64_t v8 = 0;
        id v5 = (id)v9;
      }
      goto LABEL_15;
    }
    if (a4)
    {
      id v11 = (id)[[NSString alloc] initWithFormat:@"Unknown model extension: %@", v5];
      [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v11];
      uint64_t v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

      goto LABEL_17;
    }
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:@"could not locate VisionCore.framework"];
    uint64_t v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  uint64_t v8 = 0;
LABEL_17:

  return v8;
}

+ (id)E5RTURLForModelBundle:(id)a3 modelFileIsBaseName:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = v8;
  if (v6)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [a1 E5RTBaseModelName:v8 error:a5];
  }
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 stringByAppendingString:@".bundle"];
    id v13 = [a1 URLForResourceFileNamed:v12 error:a5];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)E5RTBaseModelName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = [v5 lastPathComponent];
  if (([v6 hasSuffix:@".mil"] & 1) != 0
    || [v6 hasSuffix:@".bundle"])
  {
    id v7 = [v6 stringByDeletingPathExtension];
LABEL_4:
    id v8 = v7;
    goto LABEL_5;
  }
  if (![v6 hasSuffix:@".espresso.net"])
  {
    if (a4)
    {
      id v11 = (void *)[[NSString alloc] initWithFormat:@"Unknown format for model: %@", v6];
      *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v11];
    }
    id v7 = v5;
    goto LABEL_4;
  }
  id v10 = [v6 stringByDeletingPathExtension];
  id v8 = [v10 stringByDeletingPathExtension];

LABEL_5:
  return v8;
}

+ (id)URLForResourceFileNamed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 isAbsolutePath])
  {
    BOOL v6 = [NSURL fileURLWithPath:v5];
  }
  else
  {
    id v7 = VisionCoreFrameworkBundle();
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 URLForResource:v5 withExtension:0];
      BOOL v6 = v9;
      if (v9)
      {
        id v10 = v9;
      }
      else if (a4)
      {
        id v11 = (void *)[[NSString alloc] initWithFormat:@"Could not locate resource named \"%@\"", v5];
        *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v11];
      }
    }
    else if (a4)
    {
      [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:@"could not locate VisionCore.framework"];
      BOOL v6 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

@end
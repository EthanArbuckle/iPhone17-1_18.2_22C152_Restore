@interface SCMLImageLabelCoder
+ (id)_createHexDecodingDict;
+ (id)_createHexEncodingDict;
+ (id)_nameFromRevParts:(id)a3;
+ (id)instance;
- (NSDictionary)_decodeFromHexDict;
- (NSDictionary)_encodeToHexDict;
- (SCMLImageLabelCoder)init;
- (id)decodeFromHex:(id)a3;
- (id)decodeFromP1:(id)a3;
- (id)encodeToHex:(id)a3;
- (id)encodeToP1:(id)a3;
- (void)set_decodeFromHexDict:(id)a3;
- (void)set_encodeToHexDict:(id)a3;
@end

@implementation SCMLImageLabelCoder

+ (id)_nameFromRevParts:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F089D8] string];
  int v5 = [v3 count];
  if (v5 >= 1)
  {
    unint64_t v6 = v5 + 1;
    do
    {
      v7 = [v3 objectAtIndexedSubscript:(v6 - 2)];
      [v4 appendString:v7];

      --v6;
    }
    while (v6 > 1);
  }

  return v4;
}

+ (id)_createHexEncodingDict
{
  v66[3] = *MEMORY[0x263EF8340];
  id v3 = [a1 _nameFromRevParts:&unk_270979EA0];
  v66[0] = [a1 _nameFromRevParts:&unk_270979EB8];
  v66[1] = @"e";
  v66[2] = @"f";
  v46 = (void *)v66[0];
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:3];
  v44 = [a1 _nameFromRevParts:v4];

  v43 = [a1 _nameFromRevParts:&unk_270979ED0];
  v45 = [a1 _nameFromRevParts:&unk_270979EE8];
  v42 = [a1 _nameFromRevParts:&unk_270979F00];
  v40 = [a1 _nameFromRevParts:&unk_270979F18];
  v41 = [a1 _nameFromRevParts:&unk_270979F30];
  v39 = [a1 _nameFromRevParts:&unk_270979F48];
  v47 = [a1 _nameFromRevParts:&unk_270979F60];
  v63[0] = @"y";
  v63[1] = @"n";
  v63[2] = @"a";
  v63[3] = v3;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:4];
  v37 = [a1 _nameFromRevParts:v38];
  v64[0] = v37;
  v65[0] = @"d61a476a2e70af249c2b1695097eeea9";
  v62[0] = v40;
  v62[1] = v3;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:2];
  v35 = objc_msgSend(a1, "_nameFromRevParts:");
  v64[1] = v35;
  v65[1] = @"3dfb9038b547f6bca709fe8c7c85dd12";
  v61[0] = v42;
  v61[1] = @"_";
  v61[2] = v40;
  v61[3] = v3;
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:4];
  v33 = objc_msgSend(a1, "_nameFromRevParts:");
  v64[2] = v33;
  v65[2] = @"39ba1360248e1ef3851974a22f0d3f28";
  v60[0] = v42;
  v60[1] = v3;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];
  v31 = objc_msgSend(a1, "_nameFromRevParts:");
  v64[3] = v31;
  v65[3] = @"60dc96fd80c33771139d6cf90639a776";
  v59[0] = v44;
  v59[1] = @"_";
  v59[2] = v45;
  v59[3] = v3;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:4];
  v29 = objc_msgSend(a1, "_nameFromRevParts:");
  v64[4] = v29;
  v65[4] = @"d9ad80f7b43abb16a607e4361c87bca3";
  v58[0] = v46;
  v58[1] = @"_";
  v58[2] = v45;
  v58[3] = v3;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:4];
  v27 = objc_msgSend(a1, "_nameFromRevParts:");
  v64[5] = v27;
  v65[5] = @"e156d20cabbf6d6cbca2f1f437738097";
  v57[0] = v41;
  v57[1] = v3;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
  v25 = objc_msgSend(a1, "_nameFromRevParts:");
  v64[6] = v25;
  v65[6] = @"64c53be656ce81ef8aad95a16847f9ce";
  v56[0] = v44;
  v56[1] = @"_";
  v56[2] = v43;
  v56[3] = v3;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:4];
  v23 = objc_msgSend(a1, "_nameFromRevParts:");
  v64[7] = v23;
  v65[7] = @"c9cc54544693ed5ad6386336207971dd";
  v55[0] = v46;
  v55[1] = @"_";
  v55[2] = v43;
  v55[3] = v3;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:4];
  v21 = objc_msgSend(a1, "_nameFromRevParts:");
  v64[8] = v21;
  v65[8] = @"85a5e1ae11b0353df314fe3763da2c56";
  v54[0] = @"ne";
  v54[1] = @"no";
  v54[2] = v3;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:3];
  v19 = objc_msgSend(a1, "_nameFromRevParts:");
  v64[9] = v19;
  v65[9] = @"58484718d77c0af68837b49bde584d48";
  v53[0] = v39;
  v53[1] = v3;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
  v17 = objc_msgSend(a1, "_nameFromRevParts:");
  v64[10] = v17;
  v65[10] = @"63f9d5d4ca6958521ae9de3dcaa6fef6";
  v52[0] = v44;
  v52[1] = @"_";
  v52[2] = v45;
  v52[3] = @"_";
  v52[4] = v47;
  v52[5] = v3;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:6];
  v15 = objc_msgSend(a1, "_nameFromRevParts:");
  v64[11] = v15;
  v65[11] = @"662d129f7fdcfcc2bc753dabe3e1780e";
  v51[0] = v46;
  v51[1] = @"_";
  v51[2] = v45;
  v51[3] = @"_";
  v51[4] = v47;
  v51[5] = v3;
  int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:6];
  unint64_t v6 = [a1 _nameFromRevParts:v5];
  v64[12] = v6;
  v65[12] = @"a3d79da61dcf2cb021df38b627c46289";
  v50[0] = v41;
  v50[1] = @"_";
  v50[2] = v47;
  v50[3] = v3;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:4];
  v8 = [a1 _nameFromRevParts:v7];
  v64[13] = v8;
  v65[13] = @"7912fcde30eb40530c85a32a9b9a08ba";
  v49[0] = v44;
  v49[1] = @"_";
  v49[2] = v43;
  v49[3] = @"_";
  v49[4] = v47;
  v49[5] = v3;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:6];
  v10 = [a1 _nameFromRevParts:v9];
  v64[14] = v10;
  v65[14] = @"0766812f995688dd349887ffa981ccc3";
  v48[0] = v46;
  v48[1] = @"_";
  v48[2] = v43;
  v48[3] = @"_";
  v48[4] = v47;
  v48[5] = v3;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:6];
  v12 = [a1 _nameFromRevParts:v11];
  v64[15] = v12;
  v65[15] = @"e123c2b2c0d21152b6956aa6de88a159";
  id v14 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:16];

  return v14;
}

+ (id)_createHexDecodingDict
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [a1 _createHexEncodingDict];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v9 = objc_msgSend(v4, "objectForKeyedSubscript:", v8, (void)v11);
        [v3 setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v3;
}

+ (id)instance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SCMLImageLabelCoder_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[SCMLImageLabelCoder instance]::onceToken != -1) {
    dispatch_once(&+[SCMLImageLabelCoder instance]::onceToken, block);
  }
  v2 = (void *)+[SCMLImageLabelCoder instance]::sharedCoder;

  return v2;
}

uint64_t __31__SCMLImageLabelCoder_instance__block_invoke(uint64_t a1)
{
  +[SCMLImageLabelCoder instance]::sharedCoder = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (SCMLImageLabelCoder)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCMLImageLabelCoder;
  v2 = [(SCMLImageLabelCoder *)&v6 init];
  if (v2)
  {
    id v3 = +[SCMLImageLabelCoder _createHexEncodingDict];
    [(SCMLImageLabelCoder *)v2 set_encodeToHexDict:v3];

    id v4 = +[SCMLImageLabelCoder _createHexDecodingDict];
    [(SCMLImageLabelCoder *)v2 set_decodeFromHexDict:v4];
  }
  return v2;
}

- (id)encodeToHex:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SCMLImageLabelCoder *)self _encodeToHexDict];
  objc_super v6 = [v5 valueForKey:v4];

  return v6;
}

- (id)decodeFromHex:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SCMLImageLabelCoder *)self _decodeFromHexDict];
  objc_super v6 = [v5 valueForKey:v4];

  return v6;
}

- (id)encodeToP1:(id)a3
{
  id v3 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v3 UTF8String]);
  id v4 = 0;
  while (((char)v11 & 0x80000000) == 0)
  {
    uint64_t v5 = __p;
    if ((unint64_t)v4 >= v11) {
      goto LABEL_12;
    }
LABEL_6:
    int v6 = v4[(void)v5];
    if ((v6 - 97) <= 0x19)
    {
      if (v6 == 122) {
        char v7 = 97;
      }
      else {
        char v7 = v6 + 1;
      }
      v4[(void)v5] = v7;
    }
    ++v4;
  }
  uint64_t v5 = (void **)__p[0];
  if (__p[1] > v4) {
    goto LABEL_6;
  }
LABEL_12:
  uint64_t v8 = [NSString stringWithUTF8String:v5];
  if ((char)v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

- (id)decodeFromP1:(id)a3
{
  id v3 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v3 UTF8String]);
  id v4 = 0;
  while (((char)v11 & 0x80000000) == 0)
  {
    uint64_t v5 = __p;
    if ((unint64_t)v4 >= v11) {
      goto LABEL_12;
    }
LABEL_6:
    int v6 = v4[(void)v5];
    if ((v6 - 97) <= 0x19)
    {
      if (v6 == 97) {
        char v7 = 122;
      }
      else {
        char v7 = v6 - 1;
      }
      v4[(void)v5] = v7;
    }
    ++v4;
  }
  uint64_t v5 = (void **)__p[0];
  if (__p[1] > v4) {
    goto LABEL_6;
  }
LABEL_12:
  uint64_t v8 = [NSString stringWithUTF8String:v5];
  if ((char)v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

- (NSDictionary)_encodeToHexDict
{
  return self->__encodeToHexDict;
}

- (void)set_encodeToHexDict:(id)a3
{
}

- (NSDictionary)_decodeFromHexDict
{
  return self->__decodeFromHexDict;
}

- (void)set_decodeFromHexDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__decodeFromHexDict, 0);

  objc_storeStrong((id *)&self->__encodeToHexDict, 0);
}

@end
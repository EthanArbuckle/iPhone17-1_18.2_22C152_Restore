@interface CMDPGrammar
- (CMDPGrammar)initWithCommandTreeDictionary:(id)a3 forLocaleIdentifier:(id)a4;
- (id).cxx_construct;
- (id)grammarData;
- (void)addAdlibFstWithLabel:(const void *)a3 outputIndex:(int)a4;
- (void)addOptionalFstWithLabel;
- (void)addPhrase:(id)a3 toFst:(void *)a4 withArc:(_FstArc)a5;
- (void)buildGrammarFst:(void *)a3 forCommandTree:(id)a4 withFstArcDictionary:(id)a5;
- (void)grammarFst;
@end

@implementation CMDPGrammar

- (CMDPGrammar)initWithCommandTreeDictionary:(id)a3 forLocaleIdentifier:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  v10.receiver = self;
  v10.super_class = (Class)CMDPGrammar;
  if ([(CMDPGrammar *)&v10 init])
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (v7)
    {
      CFLocaleCreate(v8, v7);
      operator new();
    }
    CFLocaleCreate(v8, @"en_US");
    operator new();
  }

  return 0;
}

- (void)grammarFst
{
  if (self->_rebuildGrammar)
  {
    if (self->_labelFstPairVector.__begin_ != self->_labelFstPairVector.__end_) {
      cmdp_fst_util::replace((uint64_t)self->_grammarFst.__ptr_.__value_, &self->_labelFstPairVector.__begin_);
    }
    self->_rebuildGrammar = 0;
  }
  return self->_grammarFst.__ptr_.__value_;
}

- (id)grammarData
{
  return self->_grammarDataArray;
}

- (void)buildGrammarFst:(void *)a3 forCommandTree:(id)a4 withFstArcDictionary:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v7 objectForKey:kSRCSCommandParseDictionaryKeyAttributes[0]];
  objc_super v10 = [v9 objectForKey:kSRCSCommandParseAttributeOptional[0]];
  int v52 = [v10 BOOLValue];

  v11 = [v8 objectForKey:v7];
  uint64_t v53 = [v11 arcValue];

  v12 = [v7 objectForKey:kSRCSCommandParseDictionaryKeyText[0]];

  if (v12)
  {
    v13 = [v7 objectForKey:kSRCSCommandParseDictionaryKeyText[0]];
    [(CMDPGrammar *)self addPhrase:v13 toFst:a3 withArc:v53];

    goto LABEL_3;
  }
  v14 = [v7 objectForKey:kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]];
  if ([v14 BOOLValue])
  {
    v15 = [v7 objectForKey:kSRCSCommandParseDictionaryKeyIdentifier[0]];
    if ([v15 isEqualToString:@"BuiltInLM.Dictation"])
    {

LABEL_21:
      v25 = [v7 objectForKey:kSRCSCommandParseDictionaryKeyIdentifier[0]];
      v26 = [[CMDPGrammarData alloc] initWithGrammarDataWord:0 lmIdentifer:v25 commandIdentifier:self->_currentCommandIdentifier];
      [(NSMutableArray *)self->_grammarDataArray addObject:v26];
      int nextLabelIndex = self->_nextLabelIndex;
      self->_int nextLabelIndex = nextLabelIndex + 1;
      std::to_string(&__p, nextLabelIndex);
      v28 = std::string::insert(&__p, 0, "$$ADLIB");
      long long v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
      std::string::size_type v57 = v28->__r_.__value_.__r.__words[2];
      *(_OWORD *)v56 = v29;
      v28->__r_.__value_.__l.__size_ = 0;
      v28->__r_.__value_.__r.__words[2] = 0;
      v28->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      [(CMDPGrammar *)self addAdlibFstWithLabel:v56 outputIndex:[(NSMutableArray *)self->_grammarDataArray count] - 1];
      CMDPFst::addArc((uint64_t)a3, v53, SHIDWORD(v53), (uint64_t)v56, (uint64_t)v56, 0.0);
      if (SHIBYTE(v57) < 0) {
        operator delete(v56[0]);
      }

      goto LABEL_3;
    }
    v23 = [v7 objectForKey:kSRCSCommandParseDictionaryKeyIdentifier[0]];
    int v24 = [v23 isEqualToString:@"BuiltInLM.Dictation.2"];

    if (v24) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v16 = [v7 objectForKey:kSRCSCommandParseDictionaryKeyChildren[0]];

  if (v16)
  {
    v17 = [v7 objectForKey:kSRCSCommandParseDictionaryKeyIdentifier[0]];

    if (v17)
    {
      v18 = [v7 objectForKey:kSRCSCommandParseDictionaryKeyIdentifier[0]];
      v19 = [v7 objectForKey:kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]];
      int v20 = [v19 BOOLValue];

      uint64_t v21 = 80;
      if (v20) {
        uint64_t v21 = 72;
      }
      v22 = *(Class *)((char *)&self->super.isa + v21);
      *(Class *)((char *)&self->super.isa + v21) = v18;

      char v49 = v20;
      LODWORD(v17) = v20 ^ 1;
    }
    else
    {
      char v49 = 0;
    }
    v30 = [v7 objectForKey:kSRCSCommandParseDictionaryKeyChildren[0]];
    int v48 = (int)v17;
    uint64_t v31 = [v30 count];
    uint64_t v32 = v31;
    if (v31)
    {
      uint64_t v33 = 0;
      uint64_t v50 = v31 - 2;
      uint64_t v51 = v31 - 1;
      do
      {
        v34 = [v30 objectAtIndex:v33];
        v35 = [v7 objectForKey:kSRCSCommandParseDictionaryKeyAttributes[0]];
        v36 = [v35 objectForKey:kSRCSCommandParseAttributePath[0]];

        if (v36)
        {
          if (v33)
          {
            if (v51 == v33)
            {
              v37 = [v30 objectAtIndex:v50];
              v38 = [v8 objectForKey:v37];
              unint64_t v39 = [v38 arcValue];

              [MEMORY[0x263F08D40] valueWithArc:v53 & 0xFFFFFFFF00000000 | HIDWORD(v39)];
            }
            else
            {
              v37 = [v30 objectAtIndex:v33 - 1];
              v41 = [v8 objectForKey:v37];
              uint64_t v42 = [v41 arcValue];

              uint64_t v43 = (self->_nextFstState + 1);
              self->_nextFstState = v43;
              *((void *)&v44 + 1) = v43;
              *(void *)&long long v44 = v42;
              [MEMORY[0x263F08D40] valueWithArc:(unint64_t)(v44 >> 32)];
            v40 = };
            [v8 setObject:v40 forKey:v34];
          }
          else
          {
            if (v32 == 1)
            {
              [MEMORY[0x263F08D40] valueWithArc:v53];
            }
            else
            {
              uint64_t v45 = (self->_nextFstState + 1);
              self->_nextFstState = v45;
              [MEMORY[0x263F08D40] valueWithArc:v53 | (unint64_t)(v45 << 32)];
            v37 = };
            [v8 setObject:v37 forKey:v34];
          }
        }
        else
        {
          v37 = [MEMORY[0x263F08D40] valueWithArc:v53];
          [v8 setObject:v37 forKey:v34];
        }

        [(CMDPGrammar *)self buildGrammarFst:a3 forCommandTree:v34 withFstArcDictionary:v8];
        ++v33;
      }
      while (v32 != v33);
    }
    if (v49)
    {
      currentBuiltInLMString = self->_currentBuiltInLMString;
      self->_currentBuiltInLMString = 0;
    }
    if (v48)
    {
      currentCommandIdentifier = self->_currentCommandIdentifier;
      self->_currentCommandIdentifier = 0;
    }
  }
  else
  {
    NSLog(&cfstr_ErrorInBuildgr.isa, v7);
  }
LABEL_3:
  if (v52)
  {
    if (self->_addOptionalFst)
    {
      [(CMDPGrammar *)self addOptionalFstWithLabel];
      self->_addOptionalFst = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(v56, (char *)kCMDPReplaceOptionalLabel);
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)kCMDPReplaceOptionalLabel);
    CMDPFst::addArc((uint64_t)a3, v53, SHIDWORD(v53), (uint64_t)v56, (uint64_t)&__p, 0.0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v57) < 0) {
      operator delete(v56[0]);
    }
  }
}

- (void)addPhrase:(id)a3 toFst:(void *)a4 withArc:(_FstArc)a5
{
  uint64_t v21 = CMDPNormalizer::tokenizedString(self->_normalizer.__ptr_.__value_, (const __CFString *)a3);
  uint64_t v7 = [v21 count];
  uint64_t v8 = v7;
  unint64_t v20 = HIDWORD(*(unint64_t *)&a5);
  if (v7)
  {
    _FstArc v18 = a5;
    uint64_t v9 = v7 - 1;
    if (v7 >= 1)
    {
      uint64_t v10 = 0;
      while (1)
      {
        v11 = objc_msgSend(v21, "objectAtIndex:", v10, v18);
        if ([v11 length]) {
          break;
        }
LABEL_15:

        if (v8 == ++v10) {
          goto LABEL_23;
        }
      }
      if (v10)
      {
        int nextFstState = self->_nextFstState;
        int var0 = nextFstState;
        int v14 = v20;
        if (v9 == v10) {
          goto LABEL_11;
        }
      }
      else
      {
        int v14 = v20;
        int nextFstState = v18.var0;
        if (v8 == 1)
        {
LABEL_11:
          value = (CFLocaleRef *)self->_normalizer.__ptr_.__value_;
          id v16 = v11;
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v16 UTF8String]);
          CMDPNormalizer::normalize(value, (const char *)__p, &v24);
          if (v23 < 0) {
            operator delete(__p[0]);
          }
          v17 = [[CMDPGrammarData alloc] initWithGrammarDataWord:v16 lmIdentifer:self->_currentBuiltInLMString commandIdentifier:self->_currentCommandIdentifier];
          [(NSMutableArray *)self->_grammarDataArray addObject:v17];
          CMDPFst::addArc((uint64_t)a4, nextFstState, v14, (uint64_t)&v24, [(NSMutableArray *)self->_grammarDataArray count] - 1, 0.0);
          std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)&self->_symbol_set, (const void **)&v24.__r_.__value_.__l.__data_, (uint64_t)&v24);

          if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v24.__r_.__value_.__l.__data_);
          }
          goto LABEL_15;
        }
        int nextFstState = self->_nextFstState;
        int var0 = v18.var0;
      }
      int v14 = nextFstState + 1;
      self->_int nextFstState = nextFstState + 1;
      int nextFstState = var0;
      goto LABEL_11;
    }
  }
  else
  {
    if (self->_addOptionalFst)
    {
      [(CMDPGrammar *)self addOptionalFstWithLabel];
      self->_addOptionalFst = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(&v24, (char *)kCMDPReplaceOptionalLabel);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)kCMDPReplaceOptionalLabel);
    CMDPFst::addArc((uint64_t)a4, a5.var0, a5.var1, (uint64_t)&v24, (uint64_t)__p, 0.0);
    if (v23 < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v24.__r_.__value_.__l.__data_);
    }
  }
LABEL_23:
}

- (void)addAdlibFstWithLabel:(const void *)a3 outputIndex:(int)a4
{
}

- (void)addOptionalFstWithLabel
{
}

- (void).cxx_destruct
{
  std::__tree<std::string>::destroy((uint64_t)&self->_special_symbol_set, (char *)self->_special_symbol_set.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::string>::destroy((uint64_t)&self->_symbol_set, (char *)self->_symbol_set.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_grammarDataArray, 0);
  objc_storeStrong((id *)&self->_currentCommandIdentifier, 0);
  objc_storeStrong((id *)&self->_currentBuiltInLMString, 0);
  std::unique_ptr<CMDPNormalizer>::reset[abi:ne180100](&self->_normalizer.__ptr_.__value_, 0);
  p_labelFstPairVector = &self->_labelFstPairVector;
  std::vector<std::pair<std::string,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_labelFstPairVector);
  value = self->_grammarFst.__ptr_.__value_;
  self->_grammarFst.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void *))(*(void *)value + 8))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 3) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((void *)self + 12) = (char *)self + 104;
  *((void *)self + 17) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = (char *)self + 128;
  return self;
}

- (uint64_t)addAdlibFstWithLabel:(uint64_t)a1 outputIndex:.cold.1(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

@end
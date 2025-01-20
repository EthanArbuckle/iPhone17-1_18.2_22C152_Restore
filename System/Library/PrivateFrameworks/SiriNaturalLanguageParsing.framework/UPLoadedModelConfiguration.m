@interface UPLoadedModelConfiguration
- (BOOL)hasCalibrationModel;
- (EspressoModule)calibrationEspressoModule;
- (EspressoModule)parserEspressoModule;
- (NSLocale)locale;
- (NSString)bioLabelsVocabPath;
- (NSString)bundleId;
- (NSString)intentVocabPath;
- (UPLoadedModelConfiguration)initWithModelConfiguration:(id)a3;
- (UPPreprocessor)preprocessor;
- (void)beamMaskInput;
- (void)dealloc;
- (void)labelToValueType;
- (void)resolver;
@end

@implementation UPLoadedModelConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentVocabPath, 0);
  objc_storeStrong((id *)&self->_bioLabelsVocabPath, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
}

- (EspressoModule)calibrationEspressoModule
{
  return self->_calibrationEspressoModule;
}

- (EspressoModule)parserEspressoModule
{
  return self->_parserEspressoModule;
}

- (void)beamMaskInput
{
  return self->_beamMaskInput;
}

- (void)resolver
{
  return self->_resolver;
}

- (void)labelToValueType
{
  return self->_labelToValueType;
}

- (NSString)intentVocabPath
{
  return self->_intentVocabPath;
}

- (NSString)bioLabelsVocabPath
{
  return self->_bioLabelsVocabPath;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (UPPreprocessor)preprocessor
{
  return self->_preprocessor;
}

- (void)dealloc
{
  labelToValueType = self->_labelToValueType;
  if (labelToValueType)
  {
    uint64_t v4 = std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,std::basic_string<char16_t>>>>::~__hash_table((uint64_t)labelToValueType);
    MEMORY[0x1CB775C40](v4, 0x10A0C408EF24B1CLL);
  }
  resolver = self->_resolver;
  if (resolver)
  {
    uint64_t v6 = std::__hash_table<std::__hash_value_type<std::basic_string<char16_t>,uaap_orchestration::resolution::InverseResolutionTable>,std::__unordered_map_hasher<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,uaap_orchestration::resolution::InverseResolutionTable>,std::hash<std::basic_string<char16_t>>,std::equal_to<std::basic_string<char16_t>>,true>,std::__unordered_map_equal<std::basic_string<char16_t>,std::__hash_value_type<std::basic_string<char16_t>,uaap_orchestration::resolution::InverseResolutionTable>,std::equal_to<std::basic_string<char16_t>>,std::hash<std::basic_string<char16_t>>,true>,std::allocator<std::__hash_value_type<std::basic_string<char16_t>,uaap_orchestration::resolution::InverseResolutionTable>>>::~__hash_table((uint64_t)resolver);
    MEMORY[0x1CB775C40](v6, 0x10A0C408EF24B1CLL);
  }
  beamMaskInput = (char *)self->_beamMaskInput;
  if (beamMaskInput)
  {
    std::__hash_table<std::__hash_value_type<unsigned long,std::set<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::set<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::set<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::set<unsigned long>>>>::~__hash_table((uint64_t)(beamMaskInput + 112));
    std::__hash_table<std::__hash_value_type<unsigned long,std::set<unsigned long>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::set<unsigned long>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::set<unsigned long>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::set<unsigned long>>>>::~__hash_table((uint64_t)(beamMaskInput + 72));
    v12 = (void **)(beamMaskInput + 48);
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v12);
    v8 = (void *)*((void *)beamMaskInput + 3);
    if (v8)
    {
      *((void *)beamMaskInput + 4) = v8;
      operator delete(v8);
    }
    v12 = (void **)beamMaskInput;
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100](&v12);
    MEMORY[0x1CB775C40](beamMaskInput, 0x10A0C401A1B986CLL);
  }
  parserEspressoModule = self->_parserEspressoModule;
  if (parserEspressoModule)
  {
    uaap::EspressoModule::~EspressoModule((uaap::EspressoModule *)parserEspressoModule);
    MEMORY[0x1CB775C40]();
  }
  calibrationEspressoModule = self->_calibrationEspressoModule;
  if (calibrationEspressoModule)
  {
    uaap::EspressoModule::~EspressoModule((uaap::EspressoModule *)calibrationEspressoModule);
    MEMORY[0x1CB775C40]();
  }
  v11.receiver = self;
  v11.super_class = (Class)UPLoadedModelConfiguration;
  [(UPLoadedModelConfiguration *)&v11 dealloc];
}

- (BOOL)hasCalibrationModel
{
  return self->_calibrationEspressoModule != 0;
}

- (UPLoadedModelConfiguration)initWithModelConfiguration:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SNLPOSLoggerForCategory(7);
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = SNLPOSLoggerForCategory(7);
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "UPLoadedModelConfigurationInit", "", buf, 2u);
  }

  v9 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8DA9000, v9, OS_LOG_TYPE_DEFAULT, "BEGIN \"UPLoadedModelConfigurationInit\"", buf, 2u);
  }

  v32.receiver = self;
  v32.super_class = (Class)UPLoadedModelConfiguration;
  v10 = [(UPLoadedModelConfiguration *)&v32 init];

  if (v10)
  {
    uint64_t v11 = [v4 intentVocabPath];
    intentVocabPath = v10->_intentVocabPath;
    v10->_intentVocabPath = (NSString *)v11;

    uint64_t v13 = [v4 bioLabelsVocabPath];
    bioLabelsVocabPath = v10->_bioLabelsVocabPath;
    v10->_bioLabelsVocabPath = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = [v4 configPath];
    v28 = [v15 dictionaryWithContentsOfFile:v16];

    [v28 objectForKeyedSubscript:@"locale"];
    uint64_t v17 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:objc_claimAutoreleasedReturnValue()];
    locale = v10->_locale;
    v10->_locale = (NSLocale *)v17;

    uint64_t v19 = [v28 objectForKeyedSubscript:@"app_bundle"];
    bundleId = v10->_bundleId;
    v10->_bundleId = (NSString *)v19;

    id v21 = [v4 spanVocabPath];
    std::string::basic_string[abi:ne180100]<0>(&v31, (char *)[v21 UTF8String]);

    id v22 = [v4 grammarPath];
    std::string::basic_string[abi:ne180100]<0>(v30, (char *)[v22 UTF8String]);

    uaap_orchestration::grammar::UaapGrammar::fromFile((uint64_t)v30);
  }
  v23 = SNLPOSLoggerForCategory(7);
  v24 = v23;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v24, OS_SIGNPOST_INTERVAL_END, v6, "UPLoadedModelConfigurationInit", "", buf, 2u);
  }

  v25 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8DA9000, v25, OS_LOG_TYPE_DEFAULT, "END \"UPLoadedModelConfigurationInit\"", buf, 2u);
  }

  v26 = (UPLoadedModelConfiguration *)0;
  return v26;
}

@end
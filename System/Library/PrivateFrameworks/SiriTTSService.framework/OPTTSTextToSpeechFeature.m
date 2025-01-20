@interface OPTTSTextToSpeechFeature
- (NSArray)neural_phoneme_sequence;
- (NSArray)normalized_text;
- (NSArray)phoneme_sequence;
- (NSArray)prompts;
- (NSArray)replacement;
- (OPTTSTextToSpeechFeature)initWithFlatbuffData:(id)a3;
- (OPTTSTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4;
- (OPTTSTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4 verify:(BOOL)a5;
- (Offset<siri::speech::schema_fb::TextToSpeechFeature>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)neural_phoneme_sequence_objectAtIndex:(unint64_t)a3;
- (id)normalized_text_objectAtIndex:(unint64_t)a3;
- (id)phoneme_sequence_objectAtIndex:(unint64_t)a3;
- (id)prompts_objectAtIndex:(unint64_t)a3;
- (id)replacement_objectAtIndex:(unint64_t)a3;
- (unint64_t)neural_phoneme_sequence_count;
- (unint64_t)normalized_text_count;
- (unint64_t)phoneme_sequence_count;
- (unint64_t)prompts_count;
- (unint64_t)replacement_count;
- (void)neural_phoneme_sequence_enumerateObjectsUsingBlock:(id)a3;
- (void)normalized_text_enumerateObjectsUsingBlock:(id)a3;
- (void)phoneme_sequence_enumerateObjectsUsingBlock:(id)a3;
- (void)prompts_enumerateObjectsUsingBlock:(id)a3;
- (void)replacement_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation OPTTSTextToSpeechFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_19CEE1A10;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(OPTTSTextToSpeechFeature *)self addObjectToBuffer:&v5];
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__40__OPTTSTextToSpeechFeature_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19F3A3220);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechFeature>)addObjectToBuffer:(void *)a3
{
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  v3 = [(OPTTSTextToSpeechFeature *)self normalized_text];
  unint64_t v4 = [v3 count];
  if (v4)
  {
    if (v4 >> 62) {
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    }
    __p = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v4);
    char v6 = &__p[4 * v5];
  }
  else
  {
    __p = 0;
    char v6 = 0;
  }

  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  long long v7 = [(OPTTSTextToSpeechFeature *)self normalized_text];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v169 objects:v177 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v170;
    uint64_t v10 = __p;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v170 != v9) {
          objc_enumerationMutation(v7);
        }
        int v12 = [*(id *)(*((void *)&v169 + 1) + 8 * i) addObjectToBuffer:a3];
        int v13 = v12;
        if (v10 >= v6)
        {
          uint64_t v14 = (v10 - __p) >> 2;
          unint64_t v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 62) {
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((v6 - __p) >> 1 > v15) {
            unint64_t v15 = (v6 - __p) >> 1;
          }
          if ((unint64_t)(v6 - __p) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v16 = v15;
          }
          if (v16) {
            unint64_t v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v16);
          }
          else {
            uint64_t v17 = 0;
          }
          v18 = (char *)(v16 + 4 * v14);
          *(_DWORD *)v18 = v13;
          v19 = v18 + 4;
          if (v10 == __p)
          {
            v20 = __p;
          }
          else
          {
            v20 = __p;
            do
            {
              int v21 = *((_DWORD *)v10 - 1);
              v10 -= 4;
              *((_DWORD *)v18 - 1) = v21;
              v18 -= 4;
            }
            while (v10 != __p);
          }
          char v6 = (char *)(v16 + 4 * v17);
          if (v20) {
            operator delete(v20);
          }
          __p = v18;
          uint64_t v10 = v19;
        }
        else
        {
          *(_DWORD *)uint64_t v10 = v12;
          v10 += 4;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v169 objects:v177 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v10 = __p;
  }

  uint64_t v22 = v10 - __p;
  if (v10 == __p) {
    v23 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNormalizedText>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNormalizedText>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNormalizedText>> const&)::t;
  }
  else {
    v23 = __p;
  }
  uint64_t v24 = v22 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v22 >> 2, 4uLL);
  if (__p == v10)
  {
    LODWORD(v24) = 0;
  }
  else
  {
    v25 = v23 - 4;
    uint64_t v26 = v24;
    do
    {
      int v27 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v25[4 * v26]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v27);
      --v26;
    }
    while (v26);
  }
  int v28 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v24);
  v29 = [(OPTTSTextToSpeechFeature *)self phoneme_sequence];
  unint64_t v30 = [v29 count];
  HIDWORD(v141) = v28;
  if (v30)
  {
    if (v30 >> 62) {
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    }
    v150 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v30);
    v32 = &v150[4 * v31];
  }
  else
  {
    v150 = 0;
    v32 = 0;
  }

  long long v167 = 0u;
  long long v168 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  v33 = [(OPTTSTextToSpeechFeature *)self phoneme_sequence];
  v34 = a3;
  uint64_t v35 = [v33 countByEnumeratingWithState:&v165 objects:v176 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v166;
    v37 = v150;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v166 != v36) {
          objc_enumerationMutation(v33);
        }
        int v39 = [*(id *)(*((void *)&v165 + 1) + 8 * j) addObjectToBuffer:v34];
        int v40 = v39;
        if (v37 >= v32)
        {
          uint64_t v41 = (v37 - v150) >> 2;
          unint64_t v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 62) {
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((v32 - v150) >> 1 > v42) {
            unint64_t v42 = (v32 - v150) >> 1;
          }
          if ((unint64_t)(v32 - v150) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v43 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v43 = v42;
          }
          if (v43) {
            unint64_t v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v43);
          }
          else {
            uint64_t v44 = 0;
          }
          v45 = (char *)(v43 + 4 * v41);
          *(_DWORD *)v45 = v40;
          v46 = v45 + 4;
          if (v37 == v150)
          {
            v47 = v150;
          }
          else
          {
            v47 = v150;
            do
            {
              int v48 = *((_DWORD *)v37 - 1);
              v37 -= 4;
              *((_DWORD *)v45 - 1) = v48;
              v45 -= 4;
            }
            while (v37 != v150);
          }
          v32 = (char *)(v43 + 4 * v44);
          if (v47) {
            operator delete(v47);
          }
          v150 = v45;
          v37 = v46;
          v34 = a3;
        }
        else
        {
          *(_DWORD *)v37 = v39;
          v37 += 4;
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v165 objects:v176 count:16];
    }
    while (v35);
  }
  else
  {
    v37 = v150;
  }

  uint64_t v49 = v37 - v150;
  if (v37 == v150) {
    v50 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPhonemeSequence>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPhonemeSequence>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPhonemeSequence>> const&)::t;
  }
  else {
    v50 = v150;
  }
  uint64_t v51 = v49 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v49 >> 2, 4uLL);
  if (v150 == v37)
  {
    LODWORD(v51) = 0;
  }
  else
  {
    v52 = v50 - 4;
    uint64_t v53 = v51;
    do
    {
      int v54 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v52[4 * v53]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v54);
      --v53;
    }
    while (v53);
  }
  int v55 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v51);
  v56 = [(OPTTSTextToSpeechFeature *)self prompts];
  unint64_t v57 = [v56 count];
  LODWORD(v141) = v55;
  if (v57)
  {
    if (v57 >> 62) {
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    }
    v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v57);
    v60 = &v58[4 * v59];
  }
  else
  {
    v58 = 0;
    v60 = 0;
  }

  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  v61 = [(OPTTSTextToSpeechFeature *)self prompts];
  uint64_t v62 = [v61 countByEnumeratingWithState:&v161 objects:v175 count:16];
  if (v62)
  {
    uint64_t v63 = *(void *)v162;
    v64 = v58;
    v147 = v61;
    do
    {
      for (uint64_t k = 0; k != v62; ++k)
      {
        if (*(void *)v162 != v63) {
          objc_enumerationMutation(v61);
        }
        int v66 = objc_msgSend(*(id *)(*((void *)&v161 + 1) + 8 * k), "addObjectToBuffer:", a3, v141);
        int v67 = v66;
        if (v64 >= v60)
        {
          uint64_t v68 = (v64 - v58) >> 2;
          unint64_t v69 = v68 + 1;
          if ((unint64_t)(v68 + 1) >> 62) {
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((v60 - v58) >> 1 > v69) {
            unint64_t v69 = (v60 - v58) >> 1;
          }
          if ((unint64_t)(v60 - v58) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v70 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v70 = v69;
          }
          if (v70) {
            unint64_t v70 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v70);
          }
          else {
            uint64_t v71 = 0;
          }
          v72 = (char *)(v70 + 4 * v68);
          *(_DWORD *)v72 = v67;
          v73 = v72 + 4;
          while (v64 != v58)
          {
            int v74 = *((_DWORD *)v64 - 1);
            v64 -= 4;
            *((_DWORD *)v72 - 1) = v74;
            v72 -= 4;
          }
          v60 = (char *)(v70 + 4 * v71);
          if (v58) {
            operator delete(v58);
          }
          v58 = v72;
          v64 = v73;
          v61 = v147;
        }
        else
        {
          *(_DWORD *)v64 = v66;
          v64 += 4;
        }
      }
      uint64_t v62 = [v61 countByEnumeratingWithState:&v161 objects:v175 count:16];
    }
    while (v62);
  }
  else
  {
    v64 = v58;
  }

  uint64_t v75 = v64 - v58;
  if (v64 == v58) {
    v76 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPrompts>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPrompts>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPrompts>> const&)::t;
  }
  else {
    v76 = v58;
  }
  uint64_t v77 = v75 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v75 >> 2, 4uLL);
  if (v58 == v64)
  {
    LODWORD(v77) = 0;
  }
  else
  {
    v78 = v76 - 4;
    uint64_t v79 = v77;
    do
    {
      int v80 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v78[4 * v79]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v80);
      --v79;
    }
    while (v79);
  }
  unsigned int v143 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v77);
  v81 = [(OPTTSTextToSpeechFeature *)self replacement];
  unint64_t v82 = [v81 count];
  if (v82)
  {
    if (v82 >> 62) {
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    }
    v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v82);
    v85 = &v83[4 * v84];
  }
  else
  {
    v83 = 0;
    v85 = 0;
  }

  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  v86 = [(OPTTSTextToSpeechFeature *)self replacement];
  uint64_t v87 = [v86 countByEnumeratingWithState:&v157 objects:v174 count:16];
  if (v87)
  {
    v145 = v86;
    uint64_t v148 = *(void *)v158;
    v88 = v83;
    do
    {
      for (uint64_t m = 0; m != v87; ++m)
      {
        if (*(void *)v158 != v148) {
          objc_enumerationMutation(v86);
        }
        int v90 = objc_msgSend(*(id *)(*((void *)&v157 + 1) + 8 * m), "addObjectToBuffer:", a3, v141);
        int v91 = v90;
        if (v88 >= v85)
        {
          uint64_t v92 = (v88 - v83) >> 2;
          unint64_t v93 = v92 + 1;
          if ((unint64_t)(v92 + 1) >> 62) {
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((v85 - v83) >> 1 > v93) {
            unint64_t v93 = (v85 - v83) >> 1;
          }
          if ((unint64_t)(v85 - v83) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v94 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v94 = v93;
          }
          if (v94) {
            unint64_t v94 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v94);
          }
          else {
            uint64_t v95 = 0;
          }
          v96 = (char *)(v94 + 4 * v92);
          *(_DWORD *)v96 = v91;
          v97 = v96 + 4;
          while (v88 != v83)
          {
            int v98 = *((_DWORD *)v88 - 1);
            v88 -= 4;
            *((_DWORD *)v96 - 1) = v98;
            v96 -= 4;
          }
          v85 = (char *)(v94 + 4 * v95);
          if (v83) {
            operator delete(v83);
          }
          v83 = v96;
          v88 = v97;
          v86 = v145;
        }
        else
        {
          *(_DWORD *)v88 = v90;
          v88 += 4;
        }
      }
      uint64_t v87 = [v86 countByEnumeratingWithState:&v157 objects:v174 count:16];
    }
    while (v87);
  }
  else
  {
    v88 = v83;
  }

  uint64_t v99 = v88 - v83;
  if (v88 == v83) {
    v100 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSReplacement>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSReplacement>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSReplacement>> const&)::t;
  }
  else {
    v100 = v83;
  }
  uint64_t v101 = v99 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v99 >> 2, 4uLL);
  if (v83 == v88)
  {
    LODWORD(v101) = 0;
  }
  else
  {
    v102 = v100 - 4;
    uint64_t v103 = v101;
    do
    {
      int v104 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v102[4 * v103]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v104);
      --v103;
    }
    while (v103);
  }
  unsigned int v142 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v101);
  v105 = [(OPTTSTextToSpeechFeature *)self neural_phoneme_sequence];
  unint64_t v106 = [v105 count];
  if (v106)
  {
    if (v106 >> 62) {
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    }
    v107 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v106);
    v109 = &v107[4 * v108];
  }
  else
  {
    v107 = 0;
    v109 = 0;
  }

  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  v110 = [(OPTTSTextToSpeechFeature *)self neural_phoneme_sequence];
  uint64_t v111 = [v110 countByEnumeratingWithState:&v153 objects:v173 count:16];
  if (v111)
  {
    v146 = v110;
    uint64_t v149 = *(void *)v154;
    v112 = v107;
    do
    {
      for (uint64_t n = 0; n != v111; ++n)
      {
        if (*(void *)v154 != v149) {
          objc_enumerationMutation(v110);
        }
        int v114 = objc_msgSend(*(id *)(*((void *)&v153 + 1) + 8 * n), "addObjectToBuffer:", a3, v141);
        int v115 = v114;
        if (v112 >= v109)
        {
          uint64_t v116 = (v112 - v107) >> 2;
          unint64_t v117 = v116 + 1;
          if ((unint64_t)(v116 + 1) >> 62) {
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((v109 - v107) >> 1 > v117) {
            unint64_t v117 = (v109 - v107) >> 1;
          }
          if ((unint64_t)(v109 - v107) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v118 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v118 = v117;
          }
          if (v118) {
            unint64_t v118 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v118);
          }
          else {
            uint64_t v119 = 0;
          }
          v120 = (char *)(v118 + 4 * v116);
          *(_DWORD *)v120 = v115;
          v121 = v120 + 4;
          while (v112 != v107)
          {
            int v122 = *((_DWORD *)v112 - 1);
            v112 -= 4;
            *((_DWORD *)v120 - 1) = v122;
            v120 -= 4;
          }
          v109 = (char *)(v118 + 4 * v119);
          if (v107) {
            operator delete(v107);
          }
          v107 = v120;
          v112 = v121;
          v110 = v146;
        }
        else
        {
          *(_DWORD *)v112 = v114;
          v112 += 4;
        }
      }
      uint64_t v111 = [v110 countByEnumeratingWithState:&v153 objects:v173 count:16];
    }
    while (v111);
  }
  else
  {
    v112 = v107;
  }

  uint64_t v123 = v112 - v107;
  if (v112 == v107) {
    v124 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>> const&)::t;
  }
  else {
    v124 = v107;
  }
  uint64_t v125 = v123 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v123 >> 2, 4uLL);
  if (v107 == v112)
  {
    LODWORD(v125) = 0;
    v128 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  }
  else
  {
    v126 = v124 - 4;
    uint64_t v127 = v125;
    v128 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
    do
    {
      int v129 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v126[4 * v127]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v129);
      --v127;
    }
    while (v127);
  }
  unsigned int v130 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(v128, v125);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)v128);
  *((unsigned char *)v128 + 70) = 1;
  int v131 = *((_DWORD *)v128 + 8);
  int v132 = *((_DWORD *)v128 + 12);
  int v133 = *((_DWORD *)v128 + 10);
  if (HIDWORD(v141))
  {
    int v134 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v128, HIDWORD(v141));
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 4, v134);
  }
  if (v141)
  {
    int v135 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v128, v141);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 6, v135);
  }
  if (v143)
  {
    int v136 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v128, v143);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 8, v136);
  }
  if (v142)
  {
    int v137 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v128, v142);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 10, v137);
  }
  if (v130)
  {
    int v138 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v128, v130);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 12, v138);
  }
  v139.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(v128, v131 - v132 + v133);
  if (v107) {
    operator delete(v107);
  }
  if (v83) {
    operator delete(v83);
  }
  if (v58) {
    operator delete(v58);
  }
  if (v150) {
    operator delete(v150);
  }
  if (__p) {
    operator delete(__p);
  }
  return v139;
}

- (void)neural_phoneme_sequence_enumerateObjectsUsingBlock:(id)a3
{
  unint64_t v4 = (void (**)(id, OPTTSTTSNeuralPhonemeSequence *, uint64_t, unsigned __int8 *))a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"neural_phoneme_sequence"];
  char v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xDu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[12].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        uint64_t v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        int v13 = &v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 4 * v12 - 4;
          do
          {
            unint64_t v16 = [[OPTTSTTSNeuralPhonemeSequence alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
            v4[2](v4, v16, v14, &v19);
            int v17 = v19;

            if (v17) {
              break;
            }
            ++v14;
            v13 += 4;
            uint64_t v18 = v15;
            v15 -= 4;
          }
          while (v18);
        }
      }
    }
  }
}

- (unint64_t)neural_phoneme_sequence_count
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"neural_phoneme_sequence"];
  unint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    long long v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xDu && (uint64_t v8 = *(unsigned __int16 *)v7[12].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)neural_phoneme_sequence_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"neural_phoneme_sequence"];
  char v6 = v5;
  if (v5)
  {
    long long v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_9;
  }
  root = self->_root;
  uint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0xDu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[12].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      long long v7 = [[OPTTSTTSNeuralPhonemeSequence alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)neural_phoneme_sequence
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"neural_phoneme_sequence"];
  if (!v3)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__OPTTSTextToSpeechFeature_neural_phoneme_sequence__block_invoke;
    v6[3] = &unk_1E5920290;
    id v3 = v4;
    id v7 = v3;
    [(OPTTSTextToSpeechFeature *)self neural_phoneme_sequence_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"neural_phoneme_sequence"];
  }
  return (NSArray *)v3;
}

uint64_t __51__OPTTSTextToSpeechFeature_neural_phoneme_sequence__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)replacement_enumerateObjectsUsingBlock:(id)a3
{
  unint64_t v4 = (void (**)(id, OPTTSTTSReplacement *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"replacement"];
  char v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xBu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[10].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        uint64_t v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        int v13 = &v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 4 * v12 - 4;
          do
          {
            unint64_t v16 = [[OPTTSTTSReplacement alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
            v4[2](v4, v16, v14, &v19);
            int v17 = v19;

            if (v17) {
              break;
            }
            ++v14;
            v13 += 4;
            uint64_t v18 = v15;
            v15 -= 4;
          }
          while (v18);
        }
      }
    }
  }
}

- (unint64_t)replacement_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"replacement"];
  unint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xBu && (uint64_t v8 = *(unsigned __int16 *)v7[10].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)replacement_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"replacement"];
  char v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_9;
  }
  root = self->_root;
  uint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0xBu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[10].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      id v7 = [[OPTTSTTSReplacement alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)replacement
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"replacement"];
  if (!v3)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__OPTTSTextToSpeechFeature_replacement__block_invoke;
    v6[3] = &unk_1E5920290;
    id v3 = v4;
    id v7 = v3;
    [(OPTTSTextToSpeechFeature *)self replacement_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"replacement"];
  }
  return (NSArray *)v3;
}

uint64_t __39__OPTTSTextToSpeechFeature_replacement__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)prompts_enumerateObjectsUsingBlock:(id)a3
{
  unint64_t v4 = (void (**)(id, OPTTSTTSPrompts *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
  char v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 9u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[8].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        uint64_t v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        int v13 = &v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 4 * v12 - 4;
          do
          {
            unint64_t v16 = [[OPTTSTTSPrompts alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
            v4[2](v4, v16, v14, &v19);
            int v17 = v19;

            if (v17) {
              break;
            }
            ++v14;
            v13 += 4;
            uint64_t v18 = v15;
            v15 -= 4;
          }
          while (v18);
        }
      }
    }
  }
}

- (unint64_t)prompts_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
  unint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 9u && (uint64_t v8 = *(unsigned __int16 *)v7[8].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)prompts_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
  char v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_9;
  }
  root = self->_root;
  uint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 9u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[8].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      id v7 = [[OPTTSTTSPrompts alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)prompts
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
  if (!v3)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__OPTTSTextToSpeechFeature_prompts__block_invoke;
    v6[3] = &unk_1E5920290;
    id v3 = v4;
    id v7 = v3;
    [(OPTTSTextToSpeechFeature *)self prompts_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"prompts"];
  }
  return (NSArray *)v3;
}

uint64_t __35__OPTTSTextToSpeechFeature_prompts__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)phoneme_sequence_enumerateObjectsUsingBlock:(id)a3
{
  unint64_t v4 = (void (**)(id, OPTTSTTSPhonemeSequence *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phoneme_sequence"];
  char v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 7u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[6].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        uint64_t v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        int v13 = &v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 4 * v12 - 4;
          do
          {
            unint64_t v16 = [[OPTTSTTSPhonemeSequence alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
            v4[2](v4, v16, v14, &v19);
            int v17 = v19;

            if (v17) {
              break;
            }
            ++v14;
            v13 += 4;
            uint64_t v18 = v15;
            v15 -= 4;
          }
          while (v18);
        }
      }
    }
  }
}

- (unint64_t)phoneme_sequence_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phoneme_sequence"];
  unint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 7u && (uint64_t v8 = *(unsigned __int16 *)v7[6].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)phoneme_sequence_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phoneme_sequence"];
  char v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_9;
  }
  root = self->_root;
  uint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 7u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[6].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      id v7 = [[OPTTSTTSPhonemeSequence alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)phoneme_sequence
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phoneme_sequence"];
  if (!v3)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__OPTTSTextToSpeechFeature_phoneme_sequence__block_invoke;
    v6[3] = &unk_1E5920290;
    id v3 = v4;
    id v7 = v3;
    [(OPTTSTextToSpeechFeature *)self phoneme_sequence_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"phoneme_sequence"];
  }
  return (NSArray *)v3;
}

uint64_t __44__OPTTSTextToSpeechFeature_phoneme_sequence__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)normalized_text_enumerateObjectsUsingBlock:(id)a3
{
  unint64_t v4 = (void (**)(id, OPTTSTTSNormalizedText *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_text"];
  char v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 5u)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[4].var0;
      if (v9)
      {
        unsigned __int8 v19 = 0;
        uint64_t v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        int v13 = &v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 4 * v12 - 4;
          do
          {
            unint64_t v16 = [[OPTTSTTSNormalizedText alloc] initWithFlatbuffData:self->_data root:&v13[*(unsigned int *)v13->var0] verify:0];
            v4[2](v4, v16, v14, &v19);
            int v17 = v19;

            if (v17) {
              break;
            }
            ++v14;
            v13 += 4;
            uint64_t v18 = v15;
            v15 -= 4;
          }
          while (v18);
        }
      }
    }
  }
}

- (unint64_t)normalized_text_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_text"];
  unint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 5u && (uint64_t v8 = *(unsigned __int16 *)v7[4].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)normalized_text_objectAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_text"];
  char v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_9;
  }
  root = self->_root;
  uint64_t v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 5u)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[4].var0;
    if (v11)
    {
      uint64_t v12 = &root[v11 + *(unsigned int *)root[v11].var0];
      if (*(_DWORD *)v12->var0 <= a3) {
        __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
      }
      id v7 = [[OPTTSTTSNormalizedText alloc] initWithFlatbuffData:self->_data root:&v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0] verify:0];
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NSArray)normalized_text
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_text"];
  if (!v3)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__OPTTSTextToSpeechFeature_normalized_text__block_invoke;
    v6[3] = &unk_1E5920290;
    id v3 = v4;
    id v7 = v3;
    [(OPTTSTextToSpeechFeature *)self normalized_text_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"normalized_text"];
  }
  return (NSArray *)v3;
}

uint64_t __43__OPTTSTextToSpeechFeature_normalized_text__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (OPTTSTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTextToSpeechFeature;
  uint64_t v10 = [(OPTTSTextToSpeechFeature *)&v26 init];
  if (!v10) {
    goto LABEL_14;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_15;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    uint64_t v12 = (unsigned int *)[*p_data bytes];
    a4 = (const TextToSpeechFeature *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_14;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_15;
  }
  uint64_t v17 = [*p_data bytes];
  unint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_19CEE1A20;
  uint64_t v24 = 0;
  char v25 = 1;
  if (v18 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  unsigned __int8 v19 = (siri::speech::schema_fb::TextToSpeechFeature *)v10->_root;
  if (v19 && !siri::speech::schema_fb::TextToSpeechFeature::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_15:
  }
    v20 = 0;
  else {
LABEL_14:
  }
    v20 = v10;

  return v20;
}

- (OPTTSTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4
{
  return [(OPTTSTextToSpeechFeature *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechFeature *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (OPTTSTextToSpeechFeature)initWithFlatbuffData:(id)a3
{
  return [(OPTTSTextToSpeechFeature *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
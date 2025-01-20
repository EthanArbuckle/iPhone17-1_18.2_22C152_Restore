@interface QSSTextToSpeechFeature
- (NSArray)neural_phoneme_sequence;
- (NSArray)normalized_text;
- (NSArray)phoneme_sequence;
- (NSArray)prompts;
- (NSArray)replacement;
- (Offset<siri::speech::schema_fb::TextToSpeechFeature>)addObjectToBuffer:(void *)a3;
- (QSSTextToSpeechFeature)initWithFlatbuffData:(id)a3;
- (QSSTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4;
- (QSSTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4 verify:(BOOL)a5;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation QSSTextToSpeechFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_22B64D0D0;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(QSSTextToSpeechFeature *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__38__QSSTextToSpeechFeature_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechFeature>)addObjectToBuffer:(void *)a3
{
  uint64_t v178 = *MEMORY[0x263EF8340];
  v3 = [(QSSTextToSpeechFeature *)self normalized_text];
  unint64_t v4 = [v3 count];
  if (v4)
  {
    if (v4 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    __p = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v4);
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
  long long v7 = [(QSSTextToSpeechFeature *)self normalized_text];
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
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
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
            unint64_t v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v16);
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
    v23 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TTSNormalizedText>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TTSNormalizedText>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TTSNormalizedText>> const&)::t;
  }
  else {
    v23 = __p;
  }
  uint64_t v24 = v22 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v22 >> 2, 4uLL);
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
      int v27 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v25[4 * v26]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v27);
      --v26;
    }
    while (v26);
  }
  int v28 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v24);
  v29 = [(QSSTextToSpeechFeature *)self phoneme_sequence];
  unint64_t v30 = [v29 count];
  HIDWORD(v141) = v28;
  if (v30)
  {
    if (v30 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v150 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v30);
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
  v33 = [(QSSTextToSpeechFeature *)self phoneme_sequence];
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
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
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
            unint64_t v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v43);
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
    v50 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TTSPhonemeSequence>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TTSPhonemeSequence>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TTSPhonemeSequence>> const&)::t;
  }
  else {
    v50 = v150;
  }
  uint64_t v51 = v49 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v49 >> 2, 4uLL);
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
      int v54 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v52[4 * v53]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v54);
      --v53;
    }
    while (v53);
  }
  int v55 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v51);
  v56 = [(QSSTextToSpeechFeature *)self prompts];
  unint64_t v57 = [v56 count];
  LODWORD(v141) = v55;
  if (v57)
  {
    if (v57 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v57);
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
  v61 = [(QSSTextToSpeechFeature *)self prompts];
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
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
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
            unint64_t v70 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v70);
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
    v76 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TTSPrompts>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TTSPrompts>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TTSPrompts>> const&)::t;
  }
  else {
    v76 = v58;
  }
  uint64_t v77 = v75 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v75 >> 2, 4uLL);
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
      int v80 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v78[4 * v79]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v80);
      --v79;
    }
    while (v79);
  }
  unsigned int v143 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v77);
  v81 = [(QSSTextToSpeechFeature *)self replacement];
  unint64_t v82 = [v81 count];
  if (v82)
  {
    if (v82 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v82);
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
  v86 = [(QSSTextToSpeechFeature *)self replacement];
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
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
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
            unint64_t v94 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v94);
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
    v100 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TTSReplacement>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TTSReplacement>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TTSReplacement>> const&)::t;
  }
  else {
    v100 = v83;
  }
  uint64_t v101 = v99 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v99 >> 2, 4uLL);
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
      int v104 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v102[4 * v103]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v104);
      --v103;
    }
    while (v103);
  }
  unsigned int v142 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v101);
  v105 = [(QSSTextToSpeechFeature *)self neural_phoneme_sequence];
  unint64_t v106 = [v105 count];
  if (v106)
  {
    if (v106 >> 62) {
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    }
    v107 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v106);
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
  v110 = [(QSSTextToSpeechFeature *)self neural_phoneme_sequence];
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
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
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
            unint64_t v118 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v118);
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
    v124 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>> const&)::t;
  }
  else {
    v124 = v107;
  }
  uint64_t v125 = v123 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v123 >> 2, 4uLL);
  if (v107 == v112)
  {
    LODWORD(v125) = 0;
    v128 = (flatbuffers::FlatBufferBuilder *)a3;
  }
  else
  {
    v126 = v124 - 4;
    uint64_t v127 = v125;
    v128 = (flatbuffers::FlatBufferBuilder *)a3;
    do
    {
      int v129 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v126[4 * v127]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v129);
      --v127;
    }
    while (v127);
  }
  unsigned int v130 = flatbuffers::FlatBufferBuilder::EndVector(v128, v125);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v128);
  *((unsigned char *)v128 + 70) = 1;
  int v131 = *((_DWORD *)v128 + 8);
  int v132 = *((_DWORD *)v128 + 12);
  int v133 = *((_DWORD *)v128 + 10);
  if (HIDWORD(v141))
  {
    int v134 = flatbuffers::FlatBufferBuilder::ReferTo(v128, HIDWORD(v141));
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 4, v134);
  }
  if (v141)
  {
    int v135 = flatbuffers::FlatBufferBuilder::ReferTo(v128, v141);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 6, v135);
  }
  if (v143)
  {
    int v136 = flatbuffers::FlatBufferBuilder::ReferTo(v128, v143);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 8, v136);
  }
  if (v142)
  {
    int v137 = flatbuffers::FlatBufferBuilder::ReferTo(v128, v142);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 10, v137);
  }
  if (v130)
  {
    int v138 = flatbuffers::FlatBufferBuilder::ReferTo(v128, v130);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 12, v138);
  }
  v139.var0 = flatbuffers::FlatBufferBuilder::EndTable(v128, v131 - v132 + v133);
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

- (NSArray)neural_phoneme_sequence
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"neural_phoneme_sequence"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xDu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[12].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            int v12 = [[QSSTTSNeuralPhonemeSequence alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"neural_phoneme_sequence"];
  }
  return (NSArray *)v3;
}

- (NSArray)replacement
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"replacement"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xBu)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[10].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            int v12 = [[QSSTTSReplacement alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"replacement"];
  }
  return (NSArray *)v3;
}

- (NSArray)prompts
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"prompts"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 9u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[8].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            int v12 = [[QSSTTSPrompts alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"prompts"];
  }
  return (NSArray *)v3;
}

- (NSArray)phoneme_sequence
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"phoneme_sequence"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 7u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[6].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            int v12 = [[QSSTTSPhonemeSequence alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"phoneme_sequence"];
  }
  return (NSArray *)v3;
}

- (NSArray)normalized_text
{
  v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"normalized_text"];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    root = self->_root;
    uint64_t v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 5u)
    {
      uint64_t v6 = *(unsigned __int16 *)v5[4].var0;
      if (v6)
      {
        long long v7 = &root[v6];
        uint64_t v8 = *(unsigned int *)v7->var0;
        uint64_t v10 = &v7[v8 + 4];
        uint64_t v9 = *(unsigned int *)v7[v8].var0;
        if (v9)
        {
          uint64_t v11 = 4 * v9;
          do
          {
            int v12 = [[QSSTTSNormalizedText alloc] initWithFlatbuffData:self->_data root:&v10[*(unsigned int *)v10->var0] verify:0];
            [v3 addObject:v12];

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"normalized_text"];
  }
  return (NSArray *)v3;
}

- (QSSTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTextToSpeechFeature;
  uint64_t v10 = [(QSSTextToSpeechFeature *)&v30 init];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_16;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      int v13 = (unsigned int *)[*p_data bytes];
      a4 = (const TextToSpeechFeature *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_16;
      }
      uint64_t v18 = [*p_data bytes];
      unint64_t v19 = [*p_data length];
      uint64_t v25 = v18;
      unint64_t v26 = v19;
      long long v27 = xmmword_22B64D0E0;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (siri::speech::schema_fb::TextToSpeechFeature *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TextToSpeechFeature::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (QSSTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4
{
  return [(QSSTextToSpeechFeature *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechFeature *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSTextToSpeechFeature)initWithFlatbuffData:(id)a3
{
  return [(QSSTextToSpeechFeature *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end
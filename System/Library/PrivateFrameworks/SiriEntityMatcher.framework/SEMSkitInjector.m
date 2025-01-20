@interface SEMSkitInjector
- (BOOL)_analyzeCascadeEntity:(id)a3 outSearchGroup:(unsigned __int16 *)a4 indexTokens:(void *)a5 builder:(void *)a6 error:(id *)a7;
- (BOOL)_buildDocumentsFromEntities:(id)a3 error:(id *)a4;
- (BOOL)isEmpty;
- (BOOL)setEntityPool:(id)a3 error:(id *)a4;
- (BOOL)supportsIndexSiteType:(unsigned __int8)a3;
- (NSString)description;
- (SEMSkitInjector)init;
- (SEMSkitInjector)initWithTokenizer:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)accessDescription;
- (id)indexLocale;
- (id)matchSpans:(id)a3 error:(id *)a4;
@end

@implementation SEMSkitInjector

- (SEMSkitInjector)initWithTokenizer:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v79.receiver = self;
  v79.super_class = (Class)SEMSkitInjector;
  v8 = [(SEMSkitInjector *)&v79 init];
  v9 = v8;
  if (!v8)
  {
LABEL_64:
    v41 = v9;
    goto LABEL_65;
  }
  p_tokenizer = (void **)&v8->_tokenizer;
  objc_storeStrong((id *)&v8->_tokenizer, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = objc_msgSend_locale(*p_tokenizer, v11, v12, v13);
    v18 = (const char *)sub_25C7FFB90(v14, v15, v16, v17);

    if (v18)
    {
      sub_25C80DB5C(v19, v21, &v78);
      sub_25C80DC10(v22, v23, &v77);
      if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0) {
        sub_25C7D0C40(&__dst, v78.__r_.__value_.__l.__data_, v78.__r_.__value_.__l.__size_);
      }
      else {
        __dst.__pn_ = v78;
      }
      if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
        sub_25C7D0C40(&v66, v77.__r_.__value_.__l.__data_, v77.__r_.__value_.__l.__size_);
      }
      else {
        v66.__pn_ = v77;
      }
      sub_25C7D42A0((uint64_t)&v68, &__dst, &v66);
      cntrl = (std::__shared_weak_count *)v9->_indexer.context.pimpl.__cntrl_;
      v9->_indexer.context = v68;
      ContextV2 v68 = (ContextV2)0;
      if (cntrl) {
        sub_25C7D2280(cntrl);
      }
      skit::IndexWriter::operator=();
      v9->_indexer.index_locale = v69[1];
      p_index_locale_id = (void **)&v9->_indexer.index_locale_id;
      if (*((char *)&v9->_indexer.index_locale_id.__r_.__value_.var0.__l + 23) < 0) {
        operator delete(*p_index_locale_id);
      }
      uint64_t v44 = v71;
      *(_OWORD *)p_index_locale_id = *(_OWORD *)__p;
      *((void *)&v9->_indexer.index_locale_id.__r_.__value_.var0.__l + 2) = v44;
      HIBYTE(v71) = 0;
      LOWORD(__p[0]) = 0;
      long long v45 = v72;
      long long v72 = 0uLL;
      var0 = (std::__shared_weak_count *)v9->_indexer.index_locale_id.var0;
      *(_OWORD *)&v9->_indexer.index_locale_id.__r_.var0 = v45;
      if (var0) {
        sub_25C7D2280(var0);
      }
      long long v47 = v73;
      long long v73 = 0uLL;
      v48 = *(std::__shared_weak_count **)&v9->_anon_58[8];
      *(_OWORD *)v9->_anon_58 = v47;
      if (v48) {
        sub_25C7D2280(v48);
      }
      long long v49 = v74;
      long long v74 = 0uLL;
      v50 = *(std::__shared_weak_count **)&v9->_anon_58[24];
      *(_OWORD *)&v9->_anon_58[16] = v49;
      if (v50)
      {
        sub_25C7D2280(v50);
        v51 = (std::__shared_weak_count *)*((void *)&v74 + 1);
        __int16 v52 = v76;
        *(_OWORD *)&v9->_anon_58[32] = v75;
        *(_WORD *)&v9->_anon_58[48] = v52;
        if (v51) {
          sub_25C7D2280(v51);
        }
      }
      else
      {
        __int16 v53 = v76;
        *(_OWORD *)&v9->_anon_58[32] = v75;
        *(_WORD *)&v9->_anon_58[48] = v53;
      }
      if (*((void *)&v73 + 1)) {
        sub_25C7D2280(*((std::__shared_weak_count **)&v73 + 1));
      }
      if (*((void *)&v72 + 1)) {
        sub_25C7D2280(*((std::__shared_weak_count **)&v72 + 1));
      }
      if (SHIBYTE(v71) < 0) {
        operator delete(__p[0]);
      }
      MEMORY[0x261193EB0](v69);
      skit::ContextV2::~ContextV2((skit::ContextV2 *)&v68);
      if (SHIBYTE(v66.__pn_.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v66.__pn_.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__dst.__pn_.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__dst.__pn_.__r_.__value_.__l.__data_);
      }
      if (*p_tokenizer)
      {
        objc_msgSend_tokenizer(*p_tokenizer, v54, v55, v56);
      }
      else
      {
        uint64_t v64 = 0;
        v65 = 0;
      }
      sub_25C7D673C((uint64_t)&v9->_indexer, v18, 0, 0, 0, (uint64_t)&v64);
      if (v65) {
        sub_25C7D2280(v65);
      }
      if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0) {
        sub_25C7D0C40(&v63, v78.__r_.__value_.__l.__data_, v78.__r_.__value_.__l.__size_);
      }
      else {
        v63.__pn_ = v78;
      }
      if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
        sub_25C7D0C40(&v62, v77.__r_.__value_.__l.__data_, v77.__r_.__value_.__l.__size_);
      }
      else {
        v62.__pn_ = v77;
      }
      sub_25C7D90D8(&v68, &v63, &v62);
      ContextV2 v57 = v68;
      ContextV2 v68 = (ContextV2)0;
      v58 = (std::__shared_weak_count *)v9->_searcher.context.pimpl.__cntrl_;
      v9->_searcher.context = v57;
      if (v58) {
        sub_25C7D2280(v58);
      }
      skit::IndexReader::operator=();
      Alias v59 = *(Alias *)__p;
      __p[0] = 0;
      __p[1] = 0;
      v60 = (std::__shared_weak_count *)v9->_searcher.alias.pimpl.__cntrl_;
      v9->_searcher.alias = v59;
      if (v60)
      {
        sub_25C7D2280(v60);
        if (__p[1]) {
          sub_25C7D2280((std::__shared_weak_count *)__p[1]);
        }
      }
      MEMORY[0x261193DD0](v69);
      skit::ContextV2::~ContextV2((skit::ContextV2 *)&v68);
      if (SHIBYTE(v62.__pn_.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v62.__pn_.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v63.__pn_.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v63.__pn_.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v77.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v78.__r_.__value_.__l.__data_);
      }
      goto LABEL_64;
    }
    v33 = NSString;
    v27 = objc_msgSend_locale(*p_tokenizer, v19, v20, v21);
    v30 = objc_msgSend_localeIdentifier(v27, v34, v35, v36);
    v32 = objc_msgSend_stringWithFormat_(v33, v37, @"Invalid tokenizer locale %@", v38, v30);
    v39 = sub_25C813028(0, 4, v32);
    v40 = v39;
    if (a4 && v39) {
      *a4 = v39;
    }
  }
  else
  {
    v24 = NSString;
    v25 = *p_tokenizer;
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    v30 = objc_msgSend_stringWithFormat_(v24, v28, @"Invalid tokenizer %@ exptected a valid instance of class %@", v29, v25, v27);
    v31 = sub_25C813028(0, 3, v30);
    v32 = v31;
    if (a4 && v31) {
      *a4 = v31;
    }
  }

  v41 = 0;
LABEL_65:

  return v41;
}

- (SEMSkitInjector)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)_buildDocumentsFromEntities:(id)a3 error:(id *)a4
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v71 = a3;
  unint64_t v8 = objc_msgSend_count(v71, v5, v6, v7);
  if (v8)
  {
    begin = self->_documents.__begin_;
    p_documents = (uint64_t *)&self->_documents;
    if (v8 > ((char *)self->_documents.__end_cap_.__value_ - (char *)begin) >> 5)
    {
      if (v8 >> 59) {
        sub_25C7D06B8();
      }
      end = self->_documents.__end_;
      *(void *)&long long v86 = &self->_documents.__end_cap_;
      *(void *)&long long v84 = sub_25C7DCC28(v8);
      *((void *)&v84 + 1) = v84 + end - begin;
      *(void *)&long long v85 = *((void *)&v84 + 1);
      *((void *)&v85 + 1) = v84 + 32 * v11;
      sub_25C80AB38(p_documents, &v84);
      sub_25C80ABCC((uint64_t)&v84);
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obj = v71;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v79, (uint64_t)v92, 16);
    if (v15)
    {
      long long v75 = self;
      p_end_cap = &self->_documents.__end_cap_;
      uint64_t v73 = *(void *)v80;
      uint64_t v16 = &unk_2654DF000;
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v80 != v73) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v79 + 1) + 8 * v17);
          if (!objc_msgSend_conformsToProtocol_(v18, v13, (uint64_t)&unk_2709F23D0, v14)
            || (objc_opt_respondsToSelector() & 1) == 0)
          {
            Alias v59 = NSString;
            v60 = NSStringFromProtocol((Protocol *)&unk_2709F23D0);
            std::__fs::filesystem::path v63 = objc_msgSend_stringWithFormat_(v59, v61, @"Entity in pool does not conform to protocol %@: %@", v62, v60, v18);
            uint64_t v64 = sub_25C813028(0, 2, v63);
            v65 = v64;
            if (a4 && v64) {
              *a4 = v64;
            }

            goto LABEL_73;
          }
          uint64_t v22 = v15;
          uint64_t v23 = v16;
          *(void *)&long long v84 = 0;
          BYTE8(v84) = 0;
          long long v85 = xmmword_25C826760;
          long long v86 = 0u;
          long long v87 = 0u;
          uint64_t v88 = 0;
          uint64_t v89 = 1;
          __int16 v90 = 256;
          uint64_t v91 = 0;
          uint64_t v76 = 0;
          uint64_t v77 = 0;
          uint64_t v78 = 0;
          __int16 v83 = 0;
          if (objc_msgSend_entityType(v18, v19, v20, v21) != 1)
          {
            std::__fs::filesystem::path v66 = objc_msgSend_stringWithFormat_(NSString, v24, @"Unsupported injected entity: %@", v25, v18);
            sub_25C813028(0, 2, v66);
            id v67 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_68;
          }
          if ((objc_msgSend__analyzeCascadeEntity_outSearchGroup_indexTokens_builder_error_(v75, v24, (uint64_t)v18, (uint64_t)&v83, &v76, &v84, a4) & 1) == 0)goto LABEL_72; {
          if (!v83)
          }
          {
            std::__fs::filesystem::path v66 = objc_msgSend_stringWithFormat_(NSString, v26, @"Injected entity failed to be analyzed: %@", v27, v18);
            sub_25C813028(0, 2, v66);
            id v67 = (id)objc_claimAutoreleasedReturnValue();
LABEL_68:
            if (a4 && v67)
            {
              id v67 = v67;
              *a4 = v67;
            }

LABEL_72:
            *(void *)buf = &v76;
            sub_25C7D025C((void ***)buf);
            sub_25C7D6C00(&v84);
LABEL_73:
            BOOL v57 = 0;
            goto LABEL_74;
          }
          uint64_t v28 = v76;
          if (v76 == v77) {
            goto LABEL_21;
          }
          int v29 = 0;
          do
          {
            v29 += (*(unsigned __int16 *)(v28 + 40) << 31 >> 31) & *(unsigned __int16 *)(v28 + 38);
            v28 += 48;
          }
          while (v28 != v77);
          if (!v29)
          {
LABEL_21:
            uint64_t v35 = qword_26B3549C0;
            if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = "-[SEMSkitInjector _buildDocumentsFromEntities:error:]";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v18;
              _os_log_impl(&dword_25C7CA000, v35, OS_LOG_TYPE_INFO, "%s Skipping injected entity that produced 0 indexed fields: %@", buf, 0x16u);
            }
          }
          else
          {
            v30 = v75;
            v31 = v75->_documents.__end_;
            value = v75->_documents.__end_cap_.__value_;
            if (v31 >= value)
            {
              uint64_t v36 = ((uint64_t)v31 - *p_documents) >> 5;
              unint64_t v37 = v36 + 1;
              if ((unint64_t)(v36 + 1) >> 59) {
                sub_25C7D06B8();
              }
              uint64_t v38 = (uint64_t)value - *p_documents;
              if (v38 >> 4 > v37) {
                unint64_t v37 = v38 >> 4;
              }
              if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v39 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v39 = v37;
              }
              v95 = p_end_cap;
              if (v39)
              {
                unint64_t v39 = (unint64_t)sub_25C7DCC28(v39);
                v30 = v75;
              }
              else
              {
                uint64_t v40 = 0;
              }
              unint64_t v41 = v39 + 32 * v36;
              *(void *)buf = v39;
              *(void *)&buf[8] = v41;
              unint64_t v94 = v39 + 32 * v40;
              *(_WORD *)unint64_t v41 = 0;
              *(void *)(v41 + 16) = 0;
              *(void *)(v41 + 24) = 0;
              *(void *)(v41 + 8) = 0;
              *(void *)&buf[16] = v41 + 32;
              sub_25C80AB38(p_documents, buf);
              v33 = v30;
              v34 = (char *)v30->_documents.__end_;
              sub_25C80ABCC((uint64_t)buf);
            }
            else
            {
              *(_WORD *)v31 = 0;
              v31[2] = 0;
              v31[3] = 0;
              v31[1] = 0;
              v33 = v75;
              v34 = (char *)(v31 + 4);
              v75->_documents.__end_ = v31 + 4;
            }
            v33->_documents.__end_ = v34;
            *((_WORD *)v34 - 16) = v83;
            v42 = (char *)sub_25C7D5258((uint64_t)&v84);
            uint64_t v43 = sub_25C7D5258((uint64_t)&v84);
            uint64_t v44 = (unsigned char *)(v43 + (v86 - v87 + DWORD2(v86)));
            unint64_t v45 = v44 - v42;
            unint64_t v46 = *((void *)v34 - 1);
            long long v47 = (char *)*((void *)v34 - 3);
            if (v46 - (unint64_t)v47 >= v44 - v42)
            {
              __int16 v53 = (unsigned char *)*((void *)v34 - 2);
              uint64_t v54 = v53 - v47;
              if (v53 - v47 >= v45)
              {
                if (v44 != v42) {
                  memmove(*((void **)v34 - 3), v42, v44 - v42);
                }
                __int16 v52 = &v47[v45];
              }
              else
              {
                if (v53 != v47)
                {
                  memmove(*((void **)v34 - 3), v42, v53 - v47);
                  long long v47 = (char *)*((void *)v34 - 2);
                }
                uint64_t v55 = &v42[v54];
                size_t v56 = v44 - &v42[v54];
                if (v56) {
                  memmove(v47, v55, v56);
                }
                __int16 v52 = &v47[v56];
              }
            }
            else
            {
              if (v47)
              {
                *((void *)v34 - 2) = v47;
                operator delete(v47);
                unint64_t v46 = 0;
                *((void *)v34 - 3) = 0;
                *((void *)v34 - 2) = 0;
                *((void *)v34 - 1) = 0;
              }
              if ((v45 & 0x8000000000000000) != 0) {
                goto LABEL_76;
              }
              uint64_t v48 = 2 * v46;
              if (2 * v46 <= v45) {
                uint64_t v48 = v44 - v42;
              }
              size_t v49 = v46 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v48;
              if ((v49 & 0x8000000000000000) != 0) {
LABEL_76:
              }
                sub_25C7D06B8();
              v50 = (char *)operator new(v49);
              v51 = v50;
              *((void *)v34 - 3) = v50;
              *((void *)v34 - 2) = v50;
              *((void *)v34 - 1) = &v50[v49];
              if (v44 != v42) {
                memcpy(v50, v42, v44 - v42);
              }
              __int16 v52 = &v51[v45];
            }
            *((void *)v34 - 2) = v52;
            uint64_t v16 = v23;
          }
          *(void *)buf = &v76;
          sub_25C7D025C((void ***)buf);
          sub_25C7D6C00(&v84);
          ++v17;
          uint64_t v15 = v22;
        }
        while (v17 != v22);
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v79, (uint64_t)v92, 16);
        BOOL v57 = 1;
        if (v15) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v57 = 1;
    }
LABEL_74:
  }
  else
  {
    v58 = qword_26B3549D8;
    BOOL v57 = 1;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      LODWORD(v84) = 136315138;
      *(void *)((char *)&v84 + 4) = "-[SEMSkitInjector _buildDocumentsFromEntities:error:]";
      _os_log_impl(&dword_25C7CA000, v58, OS_LOG_TYPE_INFO, "%s No entities to analyze", (uint8_t *)&v84, 0xCu);
    }
  }

  return v57;
}

- (BOOL)_analyzeCascadeEntity:(id)a3 outSearchGroup:(unsigned __int16 *)a4 indexTokens:(void *)a5 builder:(void *)a6 error:(id *)a7
{
  v52[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v51 = 0;
      objc_msgSend_toCascadeItem_(v12, v17, (uint64_t)&v51, v18);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      id v19 = v51;
      uint64_t v22 = v19;
      if (v13)
      {

        objc_msgSend_content(v13, v23, v24, v25);
        goto LABEL_6;
      }
      unint64_t v45 = objc_msgSend_stringWithFormat_(NSString, v20, @"KVItem failed to be converted: %@", v21, v12);
      unint64_t v46 = sub_25C813028(v22, 2, v45);
      long long v47 = v46;
      if (a7 && v46) {
        *a7 = v46;
      }
    }
    else
    {
      unint64_t v39 = objc_msgSend_stringWithFormat_(NSString, v17, @"Unexpected injected Cascade entity: %@", v18, v12);
      uint64_t v40 = sub_25C813028(0, 2, v39);
      unint64_t v41 = v40;
      if (a7 && v40) {
        *a7 = v40;
      }
    }
    BOOL v30 = 0;
    goto LABEL_26;
  }
  id v13 = v12;
  objc_msgSend_content(v13, v14, v15, v16);
  int v29 = LABEL_6:;
  BOOL v30 = v29 != 0;
  if (v29)
  {
    v31 = objc_msgSend_metaContent(v13, v26, v27, v28);
    BOOL v32 = v31 == 0;

    if (v32)
    {
      uint64_t v38 = 0;
    }
    else
    {
      uint64_t v36 = objc_msgSend_metaContent(v13, v33, v34, v35);
      v52[0] = v36;
      uint64_t v38 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v37, (uint64_t)v52, 1);
    }
    v50[0] = "Injected";
    v50[1] = 8;
    v49[0] = 0;
    v49[1] = 0;
    unsigned __int16 v44 = sub_25C7D4B7C((uint64_t)&self->_indexer, v29, v38, (uint64_t)v50, (uint64_t)v49, (uint64_t *)a5, (unint64_t)a6);
    if (a4) {
      *a4 = v44;
    }
  }
  else
  {
    uint64_t v38 = objc_msgSend_stringWithFormat_(NSString, v26, @"Cascade item instance missing reqiured content: %@", v28, v13);
    v42 = sub_25C813028(0, 2, v38);
    uint64_t v43 = v42;
    if (a7 && v42) {
      *a7 = v42;
    }
  }
LABEL_26:

  return v30;
}

- (id)indexLocale
{
  return (id)objc_msgSend_locale(self->_tokenizer, a2, v2, v3);
}

- (BOOL)isEmpty
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  begin = self->_documents.__begin_;
  end = self->_documents.__end_;
  if (begin == end)
  {
    v5 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      unint64_t v8 = "-[SEMSkitInjector isEmpty]";
      __int16 v9 = 2112;
      v10 = self;
      _os_log_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_INFO, "%s %@ has no documents", (uint8_t *)&v7, 0x16u);
    }
  }
  return begin == end;
}

- (id)matchSpans:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10 = (uint64_t *)objc_msgSend_query(v6, v7, v8, v9);
  uint64_t v11 = *v10;
  id v12 = (std::__shared_weak_count *)v10[1];
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v11)
  {
    sub_25C7D9478((uint64_t)&self->_searcher, v11, (unsigned __int16 **)&self->_documents, v22);
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v14 = (int **)v22[0];
    uint64_t v15 = v22[1];
    while (v14 != (int **)v15)
    {
      uint64_t v16 = sub_25C80E710(v14);
      objc_msgSend_addObjectsFromArray_(v13, v17, (uint64_t)v16, v18);

      v14 += 4;
    }
    uint64_t v23 = (void **)v22;
    sub_25C7DFD20(&v23);
    if (v12) {
LABEL_8:
    }
      sub_25C7D2280(v12);
  }
  else
  {
    uint64_t v20 = sub_25C813028(0, 1, @"Query is nil");
    uint64_t v21 = v20;
    if (a4 && v20) {
      *a4 = v20;
    }

    id v13 = 0;
    if (v12) {
      goto LABEL_8;
    }
  }

  return v13;
}

- (BOOL)supportsIndexSiteType:(unsigned __int8)a3
{
  return a3 == 1;
}

- (BOOL)setEntityPool:(id)a3 error:(id *)a4
{
  p_documents = (uint64_t *)&self->_documents;
  id v7 = a3;
  sub_25C80AC30(p_documents);
  LOBYTE(a4) = objc_msgSend__buildDocumentsFromEntities_error_(self, v8, (uint64_t)v7, (uint64_t)a4);

  return (char)a4;
}

- (id)accessDescription
{
  return @"Injected";
}

- (NSString)description
{
  v5 = NSString;
  id v6 = objc_msgSend_accessDescription(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_stringWithFormat_(v5, v7, @"%@:%u", v8, v6, (unint64_t)((char *)self->_documents.__end_ - (char *)self->_documents.__begin_) >> 5);

  return (NSString *)v9;
}

- (void).cxx_destruct
{
  p_documents = &self->_documents;
  if (self->_documents.__begin_)
  {
    sub_25C80AC30((uint64_t *)&self->_documents);
    operator delete(p_documents->__begin_);
  }
  cntrl = self->_searcher.alias.pimpl.__cntrl_;
  if (cntrl) {
    sub_25C7D2280((std::__shared_weak_count *)cntrl);
  }
  MEMORY[0x261193DD0](&self->_searcher.index_reader, a2);
  skit::ContextV2::~ContextV2((skit::ContextV2 *)&self->_searcher);
  v5 = *(std::__shared_weak_count **)&self->_anon_58[24];
  if (v5) {
    sub_25C7D2280(v5);
  }
  id v6 = *(std::__shared_weak_count **)&self->_anon_58[8];
  if (v6) {
    sub_25C7D2280(v6);
  }
  var0 = (std::__shared_weak_count *)self->_indexer.index_locale_id.var0;
  if (var0) {
    sub_25C7D2280(var0);
  }
  if (*((char *)&self->_indexer.index_locale_id.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_indexer.index_locale_id.__r_.__value_.var0.__l.__data_);
  }
  MEMORY[0x261193EB0](&self->_indexer.index_writer);
  skit::ContextV2::~ContextV2((skit::ContextV2 *)&self->_indexer);
  objc_storeStrong((id *)&self->_tokenizer, 0);
}

- (id).cxx_construct
{
  self->_indexer.context.pimpl.__ptr_ = 0;
  self->_indexer.context.pimpl.__cntrl_ = 0;
  skit::IndexWriter::IndexWriter((skit::IndexWriter *)&self->_indexer.index_writer);
  *(void *)&self->_anon_58[30] = 0;
  *(_OWORD *)&self->_anon_58[16] = 0u;
  *(_OWORD *)self->_anon_58 = 0u;
  *(_OWORD *)&self->_indexer.index_locale_id.__r_.var0 = 0u;
  *(_OWORD *)&self->_indexer.index_locale_id.__r_.__value_.var0.__l.__size_ = 0u;
  *(_OWORD *)&self->_indexer.index_locale = 0u;
  *(_DWORD *)&self->_anon_58[40] = -1;
  self->_anon_58[44] = 0;
  self->_searcher.context.pimpl.__ptr_ = 0;
  self->_searcher.context.pimpl.__cntrl_ = 0;
  skit::IndexReader::IndexReader((skit::IndexReader *)&self->_searcher.index_reader);
  self->_documents.__end_cap_.__value_ = 0;
  self->_searcher.alias = 0u;
  *(_OWORD *)&self->_documents.__begin_ = 0u;
  return self;
}

@end
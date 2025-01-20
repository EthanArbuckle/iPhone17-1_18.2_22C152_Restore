@interface ML3DAAPImportOperation
- (BOOL)_importDAAPPayloadFromFile:(id)a3;
- (BOOL)_importDAAPPayloadFromFile:(id)a3 entityType:(int)a4;
- (BOOL)_preprocessDAAPPayloadFromFile:(id)a3 entityType:(int)a4;
- (BOOL)_processAlbumArtistFromArtistElement:(shared_ptr<ML3CPP::Element>)a3;
- (BOOL)_processAlbumCount:(int)a3;
- (BOOL)_processAlbumFromAlbumElement:(shared_ptr<ML3CPP::Element>)a3;
- (BOOL)_processAlbumFromTrackElement:(shared_ptr<ML3CPP:(shared_ptr<ML3DAAPImportItem>)a4 :(int64_t)a5 Element>)a3 importItem:albumArtistPersistentID:;
- (BOOL)_processArtistCount:(int)a3;
- (BOOL)_processArtistFromTrackElement:(shared_ptr<ML3CPP:(shared_ptr<ML3DAAPImportItem>)a4 :(int64_t *)a5 Element>)a3 importItem:albumArtistPersistentID:;
- (BOOL)_processContainerElement:(shared_ptr<ML3CPP:(vector<long)long :(std:()vector<std:(std::allocator<std::unordered_set<std::string>>> *)a5 :unordered_set<std::string> :allocator<long long>> *)a4 Element>)a3 withTrackIds:trackPersonIdentifiers:;
- (BOOL)_processContainerItemCount:(int)a3;
- (BOOL)_processDeletedAlbumId:(const void *)a3;
- (BOOL)_processDeletedArtistId:(const void *)a3;
- (BOOL)_processDeletedContainerId:(int64_t)a3;
- (BOOL)_processDeletedTrackId:(int64_t)a3;
- (BOOL)_processPersonElement:(shared_ptr<ML3CPP::Element>)a3;
- (BOOL)_processTrackElement:(shared_ptr<ML3CPP::Element>)a3;
- (BOOL)_processTrackImportItem:(shared_ptr<ML3DAAPImportItem>)a3;
- (BOOL)_processTrackItemCount:(int)a3;
- (BOOL)_processUpdateType:(unsigned __int8)a3;
- (BOOL)_startImportSessionIfNeeded;
- (BOOL)performImportOfSourceType:(int)a3 usingConnection:(id)a4;
- (id).cxx_construct;
- (int)_getTrackSource;
- (shared_ptr<ML3DAAPDeleteImportItem>)albumArtistItemFromDeletedDAAPArtistEntity:(const void *)a3;
- (shared_ptr<ML3DAAPDeleteImportItem>)albumItemFromDeletedDAAPAlbumEntity:(const void *)a3;
- (shared_ptr<ML3DAAPImportItem>)_trackImportItemWithTrackElement:(shared_ptr<ML3CPP::Element>)a3;
- (shared_ptr<ML3DAAPImportItem>)albumArtistImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3;
- (shared_ptr<ML3DAAPImportItem>)albumImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3;
- (shared_ptr<ML3DAAPImportItem>)albumImportItemFromDAAPTrackElement:(shared_ptr<ML3CPP::Element>)a3;
- (shared_ptr<ML3DAAPImportItem>)artistImportItemFromDAAPTrackElement:(shared_ptr<ML3CPP:(int64_t)a4 :Element>)a3 artistEntityType:;
- (shared_ptr<ML3DAAPImportItem>)containerImportItemFromDAAPElement:(shared_ptr<ML3CPP:(vector<long)long :(std:()vector<std:(std::allocator<std::unordered_set<std::string>>> *)a5 :unordered_set<std::string> :allocator<long long>> *)a4 Element>)a3 withTrackIds:trackPersonIdentifiers:;
- (shared_ptr<ML3DAAPImportItem>)importItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3;
- (shared_ptr<ML3DAAPImportItem>)personImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3;
- (void)_finishParsingWithError:(id)a3;
- (void)dealloc;
@end

@implementation ML3DAAPImportOperation

- (id).cxx_construct
{
  *((void *)self + 39) = 0;
  *((void *)self + 40) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_delegate.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }

  objc_storeStrong((id *)&self->_importError, 0);
}

- (int)_getTrackSource
{
  return self->_sourceType;
}

- (shared_ptr<ML3DAAPImportItem>)_trackImportItemWithTrackElement:(shared_ptr<ML3CPP::Element>)a3
{
  v3 = (std::__shared_weak_count *)*((void *)a3.var0 + 1);
  uint64_t v6 = *(void *)a3.var0;
  v7 = (ML3DAAPImportItem *)v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  -[ML3DAAPImportOperation importItemFromDAAPElement:](self, "importItemFromDAAPElement:", &v6, a3.var1);
  v5 = v7;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v7);
  }
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (BOOL)_processArtistFromTrackElement:(shared_ptr<ML3CPP:(shared_ptr<ML3DAAPImportItem>)a4 :(int64_t *)a5 Element>)a3 importItem:albumArtistPersistentID:
{
  var0 = a4.var0;
  var1 = a3.var1;
  v7 = a3.var0;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if ([(ML3DAAPImportOperation *)self _startImportSessionIfNeeded])
  {
    if ((*(unsigned int (**)(void))(**(void **)var1 + 16))())
    {
      v9 = (std::__shared_weak_count *)*((void *)v7 + 1);
      uint64_t v65 = *(void *)v7;
      v66 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [(ML3DAAPImportOperation *)self artistImportItemFromDAAPTrackElement:&v65 artistEntityType:2];
      long long v10 = buf[0];
      buf[0] = 0uLL;
      if (v66) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v66);
      }
      if (self->_sourceType != 2)
      {
        v19 = (std::__shared_weak_count *)*((void *)v7 + 1);
        uint64_t v63 = *(void *)v7;
        v64 = v19;
        if (v19) {
          atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        [(ML3DAAPImportOperation *)self artistImportItemFromDAAPTrackElement:&v63 artistEntityType:7];
        v20 = (std::__shared_weak_count *)*((void *)&buf[0] + 1);
        uint64_t v21 = *(void *)&buf[0];
        buf[0] = 0uLL;
        if (v64) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v64);
        }
        if (v21)
        {
          importSession = self->_importSession;
          v62[0] = v21;
          v62[1] = (uint64_t)v20;
          if (v20) {
            atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          v23 = (std::__shared_weak_count *)*((void *)var1 + 1);
          v61[0] = *(void *)var1;
          v61[1] = v23;
          if (v23) {
            atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          int v24 = ML3ImportSession::addAlbumArtist((uint64_t)importSession, v62, v61);
          if (v23) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v23);
          }
          if (v20) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v20);
          }
          if (!v24)
          {
            BOOL v16 = 0;
            if (!v20) {
              goto LABEL_67;
            }
            goto LABEL_66;
          }
          *(void *)var0 = *(void *)(v21 + 8);
        }
        v25 = v20;
        if (!(void)v10) {
          goto LABEL_61;
        }
        goto LABEL_37;
      }
      v11 = (char *)self->_importSession;
      v13 = *(void **)var1;
      v12 = (std::__shared_weak_count *)*((void *)var1 + 1);
      if (v12)
      {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
        v14 = (int *)(v11 + 32);
        if (*((_DWORD *)v11 + 8) == 2)
        {
          v74 = v13;
          v75 = v12;
          atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
          goto LABEL_47;
        }
      }
      else
      {
        v14 = (int *)(v11 + 32);
        if (*((_DWORD *)v11 + 8) == 2)
        {
          v74 = *(void **)var1;
          v75 = 0;
LABEL_47:
          int v28 = ML3ImportSession::_prepareTrackForImport((uint64_t)v11, (uint64_t *)&v74, 0, 0);
          int v29 = v28;
          if (v12)
          {
            std::__shared_weak_count::__release_shared[abi:ne180100](v12);
            if (!v29)
            {
              v72 = v13;
              v73 = v12;
              atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_79:
              char v37 = ML3ImportSession::_prepareTrackSortData((uint64_t)v11, (uint64_t *)&v72);
              if (v12) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v12);
              }
              if (v37)
              {
                if (v11[1520]
                  || ![*((id *)v11 + 286) count] && !*((void *)v11 + 284)
                  || (v11[1520] = 1, ML3ImportSession::flush((ML3ImportSession *)v11, 1)))
                {
                  char v71 = 0;
                  (*(void (**)(_OWORD *__return_ptr, void *, uint64_t))(*v13 + 24))(buf, v13, 301989899);
                  if (SBYTE7(buf[2]) < 0)
                  {
                    std::string::__init_copy_ctor_external(&v81, *(const std::string::value_type **)&buf[1], *((std::string::size_type *)&buf[1] + 1));
                    *(void *)&buf[0] = &unk_1F08C3230;
                    if (SBYTE7(buf[2]) < 0) {
                      operator delete(*(void **)&buf[1]);
                    }
                  }
                  else
                  {
                    std::string v81 = *(std::string *)&buf[1];
                  }
                  (*(void (**)(_OWORD *__return_ptr, void *, void))(*v13 + 152))(buf, v13, 0);
                  if (SBYTE7(buf[2]) < 0)
                  {
                    std::string::__init_copy_ctor_external(&v70, *(const std::string::value_type **)&buf[1], *((std::string::size_type *)&buf[1] + 1));
                    *(void *)&buf[0] = &unk_1F08C3230;
                    if (SBYTE7(buf[2]) < 0) {
                      operator delete(*(void **)&buf[1]);
                    }
                  }
                  else
                  {
                    std::string v70 = *(std::string *)&buf[1];
                  }
                  std::string::size_type size = HIBYTE(v70.__r_.__value_.__r.__words[2]);
                  if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                    std::string::size_type size = v70.__r_.__value_.__l.__size_;
                  }
                  if (size)
                  {
                    v40 = (void *)*((void *)v11 + 1);
                    v41 = ML3CPPBridgeString((const UInt8 *)&v70, 1);
                    v58 = [v40 groupingKeyForString:v41];
                  }
                  else
                  {
                    v58 = 0;
                  }
                  if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0) {
                    std::string::__init_copy_ctor_external(&v69, v81.__r_.__value_.__l.__data_, v81.__r_.__value_.__l.__size_);
                  }
                  else {
                    std::string v69 = v81;
                  }
                  ML3ImportSession::_getAlbumArtistImportItemForGroupingIdentifierAndPIDs(buf, (uint64_t)v11, v58, (uint64_t *)&v69, 0, 0, &v71);
                  long long v42 = buf[0];
                  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v69.__r_.__value_.__l.__data_);
                  }
                  if ((void)v42)
                  {
                    v44 = v43;
                    v57 = 0;
                    if (v43 && *((void *)&v42 + 1))
                    {
                      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v42 + 1) + 8), 1uLL, memory_order_relaxed);
                      v57 = (std::__shared_weak_count *)*((void *)&v42 + 1);
                    }
                    if (!(*(uint64_t (**)(void *, uint64_t))(*v43 + 32))(v43, 301989894))
                    {
                      unint64_t v56 = v44[1];
                      uint64_t v45 = (*(uint64_t (**)(void *, uint64_t))(*v13 + 32))(v13, 16777217);
                      if ((MLMediaTypeByStandardizingMediaType(v45) & 0x400) == 0
                        && !(*(uint64_t (**)(void *, uint64_t))(*v44 + 32))(v44, 301989894))
                      {
                        v44[11] = v13[1];
                        log = _ML3LogCategoryImport();
                        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                        {
                          uint64_t v46 = v13[1];
                          LODWORD(buf[0]) = 134217984;
                          *(void *)((char *)buf + 4) = v46;
                          _os_log_impl(&dword_1B022D000, log, OS_LOG_TYPE_DEFAULT, "Augmenting representative itemPID=%lld", (uint8_t *)buf, 0xCu);
                        }

                        if (!v71)
                        {
                          *(void *)&buf[0] = v56;
                          *(_OWORD *)((char *)buf + 8) = v42;
                          if (*((void *)&v42 + 1)) {
                            atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v42 + 1) + 8), 1uLL, memory_order_relaxed);
                          }
                          std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>>>::__emplace_unique_key_args<long long,std::pair<long long const,std::shared_ptr<ML3ImportItem>>>((uint64_t *)v11 + 255, v56, (uint64_t)buf);
                          if (*(void *)&buf[1]) {
                            std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[1]);
                          }
                        }
                      }
                    }
                    unint64_t v47 = v13[1];
                    uint64_t v48 = v44[8];
                    v49 = (std::__shared_weak_count *)v44[9];
                    if (v49) {
                      atomic_fetch_add_explicit(&v49->__shared_owners_, 1uLL, memory_order_relaxed);
                    }
                    v50 = v57;
                    ML3ImportSession::_setAlbumArtistInfoForTrackPersistentID((uint64_t)v11, v47, v48, v49);
                    if (v49) {
                      std::__shared_weak_count::__release_shared[abi:ne180100](v49);
                    }
                  }
                  else
                  {
                    v51 = os_log_create("com.apple.amp.medialibrary", "Import");
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      (*(void (**)(_OWORD *__return_ptr, void *))(*v13 + 88))(buf, v13);
                      if ((SBYTE7(buf[1]) & 0x80u) == 0) {
                        v52 = buf;
                      }
                      else {
                        v52 = *(_OWORD **)&buf[0];
                      }
                      v53 = &v81;
                      if ((v81.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                        v53 = (std::string *)v81.__r_.__value_.__r.__words[0];
                      }
                      *(_DWORD *)v76 = 136446466;
                      v77 = v52;
                      __int16 v78 = 2082;
                      v79 = v53;
                      _os_log_impl(&dword_1B022D000, v51, OS_LOG_TYPE_ERROR, "Could not locate album artist to augment with track data=%{public}s, cloudLibraryID=%{public}s", v76, 0x16u);
                      if (SBYTE7(buf[1]) < 0) {
                        operator delete(*(void **)&buf[0]);
                      }
                    }

                    unint64_t v54 = v13[1];
                    ML3ImportSession::_getDefaultEmptyArtist((ML3ImportSession *)&v67);
                    v50 = v68;
                    ML3ImportSession::_setAlbumArtistInfoForTrackPersistentID((uint64_t)v11, v54, v67, v68);
                  }
                  if (v50) {
                    std::__shared_weak_count::__release_shared[abi:ne180100](v50);
                  }
                  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v70.__r_.__value_.__l.__data_);
                  }
                  if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v81.__r_.__value_.__l.__data_);
                  }
                  if (*((void *)&v42 + 1)) {
                    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v42 + 1));
                  }

                  goto LABEL_57;
                }
LABEL_95:
                int v33 = 0;
                if (!v12)
                {
LABEL_59:
                  if (!v33)
                  {
                    BOOL v16 = 0;
                    goto LABEL_67;
                  }
                  v25 = 0;
                  if (!(void)v10)
                  {
LABEL_61:
                    BOOL v16 = 1;
                    goto LABEL_62;
                  }
LABEL_37:
                  v26 = self->_importSession;
                  long long v60 = v10;
                  if (*((void *)&v10 + 1)) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v10 + 1) + 8), 1uLL, memory_order_relaxed);
                  }
                  v27 = (std::__shared_weak_count *)*((void *)var1 + 1);
                  v59[0] = *(void *)var1;
                  v59[1] = v27;
                  if (v27) {
                    atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
                  }
                  BOOL v16 = ML3ImportSession::addItemArtist((uint64_t)v26, &v60, v59);
                  if (v27) {
                    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
                  }
                  if (*((void *)&v10 + 1)) {
                    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v10 + 1));
                  }
LABEL_62:
                  v20 = v25;
                  if (!v25)
                  {
LABEL_67:
                    if (*((void *)&v10 + 1)) {
                      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v10 + 1));
                    }
                    return v16;
                  }
LABEL_66:
                  std::__shared_weak_count::__release_shared[abi:ne180100](v20);
                  goto LABEL_67;
                }
LABEL_58:
                std::__shared_weak_count::__release_shared[abi:ne180100](v12);
                goto LABEL_59;
              }
              v35 = os_log_create("com.apple.amp.medialibrary", "Import");
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                (*(void (**)(_OWORD *__return_ptr, void *))(*v13 + 88))(buf, v13);
                v38 = (SBYTE7(buf[1]) & 0x80u) == 0 ? buf : *(_OWORD **)&buf[0];
                LODWORD(v81.__r_.__value_.__l.__data_) = 136446210;
                *(std::string::size_type *)((char *)v81.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
                _os_log_impl(&dword_1B022D000, v35, OS_LOG_TYPE_DEFAULT, "Error preparing track sort data for=%{public}s", (uint8_t *)&v81, 0xCu);
                if (SBYTE7(buf[1]) < 0) {
                  operator delete(*(void **)&buf[0]);
                }
              }
LABEL_94:

              goto LABEL_95;
            }
          }
          else if (!v28)
          {
            v72 = v13;
            v73 = 0;
            goto LABEL_79;
          }
          v35 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            (*(void (**)(_OWORD *__return_ptr, void *))(*v13 + 88))(buf, v13);
            v36 = (SBYTE7(buf[1]) & 0x80u) == 0 ? buf : *(_OWORD **)&buf[0];
            LODWORD(v81.__r_.__value_.__l.__data_) = 136446210;
            *(std::string::size_type *)((char *)v81.__r_.__value_.__r.__words + 4) = (std::string::size_type)v36;
            _os_log_impl(&dword_1B022D000, v35, OS_LOG_TYPE_ERROR, "Error augmenting albumArtist with track data=%{public}s", (uint8_t *)&v81, 0xCu);
            if (SBYTE7(buf[1]) < 0) {
              operator delete(*(void **)&buf[0]);
            }
          }
          goto LABEL_94;
        }
      }
      v11[1521] = 1;
      v30 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        (*(void (**)(_OWORD *__return_ptr, void *))(*v13 + 88))(buf, v13);
        v31 = (SBYTE7(buf[1]) & 0x80u) == 0 ? buf : *(_OWORD **)&buf[0];
        int v32 = *v14;
        LODWORD(v81.__r_.__value_.__l.__data_) = 136446466;
        *(std::string::size_type *)((char *)v81.__r_.__value_.__r.__words + 4) = (std::string::size_type)v31;
        WORD2(v81.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&v81.__r_.__value_.__r.__words[1] + 6) = v32;
        _os_log_impl(&dword_1B022D000, v30, OS_LOG_TYPE_ERROR, "not augmenting album artist with track data=%{public}s as it's not supported for source=%d", (uint8_t *)&v81, 0x12u);
        if (SBYTE7(buf[1]) < 0) {
          operator delete(*(void **)&buf[0]);
        }
      }

LABEL_57:
      int v33 = 1;
      if (!v12) {
        goto LABEL_59;
      }
      goto LABEL_58;
    }
    v17 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      (*(void (**)(_OWORD *__return_ptr))(**(void **)var1 + 88))(buf);
      v18 = (SBYTE7(buf[1]) & 0x80u) == 0 ? buf : *(_OWORD **)&buf[0];
      LODWORD(v81.__r_.__value_.__l.__data_) = 136446210;
      *(std::string::size_type *)((char *)v81.__r_.__value_.__r.__words + 4) = (std::string::size_type)v18;
      _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_ERROR, "Not processing artist from invalid track element=%{public}s", (uint8_t *)&v81, 0xCu);
      if (SBYTE7(buf[1]) < 0) {
        operator delete(*(void **)&buf[0]);
      }
    }

    return 1;
  }
  else
  {
    v15 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_ERROR, "failed to start import session", (uint8_t *)buf, 2u);
    }

    return 0;
  }
}

- (BOOL)_processAlbumFromTrackElement:(shared_ptr<ML3CPP:(shared_ptr<ML3DAAPImportItem>)a4 :(int64_t)a5 Element>)a3 importItem:albumArtistPersistentID:
{
  var1 = a3.var1;
  var0 = a3.var0;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if (![(ML3DAAPImportOperation *)self _startImportSessionIfNeeded])
  {
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    return 0;
  }
  if (!(*(unsigned int (**)(void))(**(void **)var1 + 16))())
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      (*(void (**)(unsigned char *__return_ptr))(**(void **)var1 + 88))(buf);
      v15 = buf[23] >= 0 ? buf : *(unsigned char **)buf;
      LODWORD(v84.__r_.__value_.__l.__data_) = 136446210;
      *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = (std::string::size_type)v15;
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "Not processing album from invalid track element=%{public}s", (uint8_t *)&v84, 0xCu);
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
    }

    return 1;
  }
  if (self->_sourceType != 2)
  {
    BOOL v16 = (std::__shared_weak_count *)*((void *)var0 + 1);
    uint64_t v68 = *(void *)var0;
    std::string v69 = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(ML3DAAPImportOperation *)self albumImportItemFromDAAPTrackElement:&v68];
    if (v69) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v69);
    }
    importSession = self->_importSession;
    v18 = *(std::__shared_weak_count **)&buf[8];
    v67[0] = *(void *)buf;
    v67[1] = *(void *)&buf[8];
    if (*(void *)&buf[8]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v19 = *(void *)var1;
    v20 = (std::__shared_weak_count *)*((void *)var1 + 1);
    v66[0] = v19;
    v66[1] = v20;
    if (v20) {
      atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v13 = ML3ImportSession::addAlbum((uint64_t)importSession, v67, v66, 0);
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    uint64_t v21 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]) {
      goto LABEL_53;
    }
    return v13;
  }
  v8 = (char *)self->_importSession;
  long long v10 = *(void **)var1;
  v9 = (std::__shared_weak_count *)*((void *)var1 + 1);
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    v11 = (int *)(v8 + 32);
    if (*((_DWORD *)v8 + 8) == 2)
    {
      std::string v81 = v10;
      uint64_t v82 = v9;
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      goto LABEL_33;
    }
LABEL_43:
    v8[1521] = 1;
    v25 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      (*(void (**)(unsigned char *__return_ptr, void *))(*v10 + 88))(buf, v10);
      v26 = buf[23] >= 0 ? buf : *(unsigned char **)buf;
      int v27 = *v11;
      LODWORD(v84.__r_.__value_.__l.__data_) = 136446466;
      *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = (std::string::size_type)v26;
      WORD2(v84.__r_.__value_.__r.__words[1]) = 1024;
      *(_DWORD *)((char *)&v84.__r_.__value_.__r.__words[1] + 6) = v27;
      _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_ERROR, "not augmenting album with track data=%{public}s as it's not supported for source=%d", (uint8_t *)&v84, 0x12u);
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
    }

    goto LABEL_50;
  }
  v11 = (int *)(v8 + 32);
  if (*((_DWORD *)v8 + 8) != 2) {
    goto LABEL_43;
  }
  std::string v81 = v10;
  uint64_t v82 = 0;
LABEL_33:
  int v22 = ML3ImportSession::_prepareTrackForImport((uint64_t)v8, (uint64_t *)&v81, 0, 0);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (!v22)
  {
    char v80 = 0;
    (*(void (**)(unsigned char *__return_ptr, void *, uint64_t))(*v10 + 24))(buf, v10, 100663348);
    if ((buf[39] & 0x80000000) != 0)
    {
      std::string::__init_copy_ctor_external(&v84, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
      *(void *)buf = &unk_1F08C3230;
      if ((buf[39] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[16]);
      }
    }
    else
    {
      std::string v84 = *(std::string *)&buf[16];
    }
    uint64_t v78 = 0;
    v79 = 0;
    v76 = v10;
    v77 = v9;
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    int v29 = ML3ImportSession::_getAlbumGroupingIdentifierForImportItem((uint64_t)v8, &v78, (uint64_t *)&v76, 0);
    if (v77) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v77);
    }
    if (v79) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v79);
    }
    int v30 = SHIBYTE(v84.__r_.__value_.__r.__words[2]);
    uint64_t v65 = v29;
    if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v75, v84.__r_.__value_.__l.__data_, v84.__r_.__value_.__l.__size_);
    }
    else {
      std::string v75 = v84;
    }
    ML3ImportSession::_getAlbumImportItemForGroupingIdentifierAndPIDs(buf, (uint64_t)v8, v29, (uint64_t *)&v75, 0, 0, &v80);
    int v32 = *(const void **)buf;
    v31 = *(std::__shared_weak_count **)&buf[8];
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v75.__r_.__value_.__l.__data_);
    }
    if (!v32)
    {
      v38 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        (*(void (**)(std::string *__return_ptr, void *))(*v10 + 88))(&__p, v10);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        v40 = (std::string *)v84.__r_.__value_.__r.__words[0];
        if (v30 >= 0) {
          v40 = &v84;
        }
        *(_DWORD *)buf = 136446722;
        *(void *)&buf[4] = p_p;
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v65;
        _os_log_impl(&dword_1B022D000, v38, OS_LOG_TYPE_ERROR, "Could not locate album to augment with track data=%{public}s, cloudLibraryID=%{public}s, albumGroupingIdentifier=%p", buf, 0x20u);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }

      unint64_t v41 = v10[1];
      ML3ImportSession::_getDefaultEmptyAlbum((ML3ImportSession *)&v72);
      long long v42 = v73;
      ML3ImportSession::_setAlbumInfoForTrackPersistentID((uint64_t)v8, v41, v72, v73);
      goto LABEL_147;
    }
    v34 = v33;
    v35 = 0;
    if (v33 && v31)
    {
      atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
      v35 = v31;
    }
    v64 = v35;
    unint64_t v63 = v33[1];
    if ((*(unsigned int (**)(void *, uint64_t))(*v10 + 56))(v10, 167772185)
      && (uint64_t v36 = (*(uint64_t (**)(void *, uint64_t))(*v10 + 32))(v10, 167772185),
          v36 != (*(uint64_t (**)(void *, uint64_t))(*v34 + 32))(v34, 285212679)))
    {
      *(_DWORD *)(v34[8] + 56) = (*(uint64_t (**)(void *, uint64_t))(*v10 + 32))(v10, 167772185);
      v43 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = (*(uint64_t (**)(void *, uint64_t))(*v10 + 32))(v10, 167772185);
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v44;
        _os_log_impl(&dword_1B022D000, v43, OS_LOG_TYPE_DEFAULT, "Augmenting user rating=%lld", buf, 0xCu);
      }

      int v37 = 1;
    }
    else
    {
      int v37 = 0;
    }
    if ((*(unsigned int (**)(void *, uint64_t))(*v10 + 56))(v10, 167772186))
    {
      uint64_t v45 = (*(uint64_t (**)(void *, uint64_t))(*v10 + 32))(v10, 167772186);
      if (v45 != (*(uint64_t (**)(void *, uint64_t))(*v34 + 32))(v34, 285212690))
      {
        *(unsigned char *)(v34[8] + 60) = (*(uint64_t (**)(void *, uint64_t))(*v10 + 32))(v10, 167772186) != 0;
        uint64_t v46 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v47 = (*(uint64_t (**)(void *, uint64_t))(*v10 + 32))(v10, 167772186);
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v47;
          _os_log_impl(&dword_1B022D000, v46, OS_LOG_TYPE_DEFAULT, "Augmenting user rating is derived=%lld", buf, 0xCu);
        }

        int v37 = 1;
      }
    }
    if ((*(unsigned int (**)(void *, uint64_t))(*v10 + 56))(v10, 100663323))
    {
      (*(void (**)(unsigned char *__return_ptr, void *, uint64_t))(*v10 + 24))(buf, v10, 100663323);
      if ((buf[39] & 0x80000000) != 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
        *(void *)buf = &unk_1F08C3230;
        if ((buf[39] & 0x80000000) != 0) {
          operator delete(*(void **)&buf[16]);
        }
      }
      else
      {
        std::string __p = *(std::string *)&buf[16];
      }
      (*(void (**)(unsigned char *__return_ptr, void *, uint64_t))(*v34 + 24))(buf, v34, 285212682);
      if ((buf[39] & 0x80000000) != 0)
      {
        std::string::__init_copy_ctor_external(&v71, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
        *(void *)buf = &unk_1F08C3230;
        if ((buf[39] & 0x80000000) != 0) {
          operator delete(*(void **)&buf[16]);
        }
      }
      else
      {
        std::string v71 = *(std::string *)&buf[16];
      }
      std::string::size_type size = HIBYTE(v71.__r_.__value_.__r.__words[2]);
      int v49 = SHIBYTE(v71.__r_.__value_.__r.__words[2]);
      if ((v71.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type size = v71.__r_.__value_.__l.__size_;
      }
      if (!size)
      {
        std::string::size_type v50 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          std::string::size_type v50 = __p.__r_.__value_.__l.__size_;
        }
        if (v50)
        {
          (*(void (**)(unsigned char *__return_ptr, void *, uint64_t))(*v10 + 24))(buf, v10, 100663323);
          if ((buf[39] & 0x80000000) != 0) {
            std::string::__init_copy_ctor_external(&__str, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
          }
          else {
            std::string __str = *(std::string *)&buf[16];
          }
          std::string::operator=((std::string *)(v34 + 10), &__str);
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__str.__r_.__value_.__l.__data_);
          }
          *(void *)buf = &unk_1F08C3230;
          if ((buf[39] & 0x80000000) != 0) {
            operator delete(*(void **)&buf[16]);
          }
          v51 = _ML3LogCategoryImport();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            v52 = &__p;
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              v52 = (std::string *)__p.__r_.__value_.__r.__words[0];
            }
            *(_DWORD *)buf = 136446210;
            *(void *)&buf[4] = v52;
            _os_log_impl(&dword_1B022D000, v51, OS_LOG_TYPE_DEFAULT, "Augmenting feedurl=%{public}s", buf, 0xCu);
          }

          int v37 = 1;
        }
      }
      if (v49 < 0) {
        operator delete(v71.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    if ((*(unsigned int (**)(void *, uint64_t))(*v10 + 56))(v10, 33554438))
    {
      uint64_t v53 = (*(uint64_t (**)(void *, uint64_t))(*v10 + 32))(v10, 33554438);
      if (v53 > (*(uint64_t (**)(void *, uint64_t))(*v34 + 32))(v34, 285212684))
      {
        *(_DWORD *)(v34[8] + 68) = (*(uint64_t (**)(void *, uint64_t))(*v10 + 32))(v10, 33554438);
        unint64_t v54 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v55 = (*(uint64_t (**)(void *, uint64_t))(*v10 + 32))(v10, 33554438);
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v55;
          _os_log_impl(&dword_1B022D000, v54, OS_LOG_TYPE_DEFAULT, "Augmenting album year=%lld", buf, 0xCu);
        }

        int v37 = 1;
      }
    }
    uint64_t v56 = (*(uint64_t (**)(void *, uint64_t))(*v10 + 32))(v10, 16777217);
    if ((MLMediaTypeByStandardizingMediaType(v56) & 0x400) != 0
      || (*(uint64_t (**)(void *, uint64_t))(*v34 + 32))(v34, 285212676))
    {
      if (v80) {
        int v57 = 0;
      }
      else {
        int v57 = v37;
      }
      long long v42 = v64;
      if (v57 != 1)
      {
LABEL_143:
        unint64_t v60 = v10[1];
        uint64_t v61 = v34[8];
        v62 = (std::__shared_weak_count *)v34[9];
        if (v62) {
          atomic_fetch_add_explicit(&v62->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        ML3ImportSession::_setAlbumInfoForTrackPersistentID((uint64_t)v8, v60, v61, v62);
        if (v62) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v62);
        }
LABEL_147:
        if (v42) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v42);
        }

        if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v84.__r_.__value_.__l.__data_);
        }
        if (v31) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v31);
        }
LABEL_50:
        char v13 = 1;
        goto LABEL_51;
      }
    }
    else
    {
      v34[15] = v10[1];
      v58 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v59 = v10[1];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v59;
        _os_log_impl(&dword_1B022D000, v58, OS_LOG_TYPE_DEFAULT, "Augmenting representative item pid=%lld", buf, 0xCu);
      }

      long long v42 = v64;
      if (v80) {
        goto LABEL_143;
      }
    }
    *(void *)buf = v63;
    *(void *)&buf[8] = v32;
    *(void *)&buf[16] = v31;
    if (v31) {
      atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>>>::__emplace_unique_key_args<long long,std::pair<long long const,std::shared_ptr<ML3ImportItem>>>((uint64_t *)v8 + 281, v63, (uint64_t)buf);
    if (*(void *)&buf[16]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[16]);
    }
    goto LABEL_143;
  }
  v23 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    (*(void (**)(unsigned char *__return_ptr, void *))(*v10 + 88))(buf, v10);
    if (buf[23] >= 0) {
      int v24 = buf;
    }
    else {
      int v24 = *(unsigned char **)buf;
    }
    LODWORD(v84.__r_.__value_.__l.__data_) = 136446210;
    *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = (std::string::size_type)v24;
    _os_log_impl(&dword_1B022D000, v23, OS_LOG_TYPE_ERROR, "Error augmenting album with track data=%{public}s", (uint8_t *)&v84, 0xCu);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
  }

  char v13 = 0;
LABEL_51:
  if (v9)
  {
    uint64_t v21 = v9;
LABEL_53:
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  return v13;
}

- (BOOL)_processAlbumFromAlbumElement:(shared_ptr<ML3CPP::Element>)a3
{
  var0 = a3.var0;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", a3.var0, a3.var1);
  double v6 = v5;
  if ([(ML3DAAPImportOperation *)self _startImportSessionIfNeeded])
  {
    v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
    uint64_t v21 = *(void *)var0;
    int v22 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(ML3DAAPImportOperation *)self albumImportItemFromDAAPElement:&v21];
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
    if ((*(unsigned int (**)(void))(**(void **)buf + 16))(*(void *)buf))
    {
      importSession = self->_importSession;
      v9 = *(std::__shared_weak_count **)&buf[8];
      long long v20 = *(_OWORD *)buf;
      if (*(void *)&buf[8]) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
      }
      v19[0] = 0;
      v19[1] = 0;
      char v10 = ML3ImportSession::addAlbum((uint64_t)importSession, (uint64_t *)&v20, v19, 0);
      if (v9) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
    }
    else
    {
      v12 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "skipping invalid album", v18, 2u);
      }

      char v10 = 1;
    }
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  else
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    char v10 = 0;
  }
  char v13 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = v14 - v6;
    _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "Import Metrics: Finished Processing Album Import in %2f seconds", buf, 0xCu);
  }

  int64_t v15 = self->_processedAlbumCount + 1;
  self->_processedAlbumCount = v15;
  *(float *)&double v16 = (float)(self->_processedTrackCount
                         + self->_processedContainerCount
                         + v15
                         + self->_processedArtistCount)
                 / (float)(self->_totalContainerCount
                         + self->_totalTrackCount
                         + self->_totalAlbumCount
                         + self->_totalArtistCount);
  [(ML3DAAPImportOperation *)self updateImportProgress:v16];
  return v10;
}

- (BOOL)_processAlbumArtistFromArtistElement:(shared_ptr<ML3CPP::Element>)a3
{
  var0 = a3.var0;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", a3.var0, a3.var1);
  double v6 = v5;
  if ([(ML3DAAPImportOperation *)self _startImportSessionIfNeeded])
  {
    v7 = (std::__shared_weak_count *)*((void *)var0 + 1);
    uint64_t v21 = *(void *)var0;
    int v22 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(ML3DAAPImportOperation *)self albumArtistImportItemFromDAAPElement:&v21];
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
    if ((*(unsigned int (**)(void))(**(void **)buf + 16))(*(void *)buf))
    {
      importSession = self->_importSession;
      v9 = *(std::__shared_weak_count **)&buf[8];
      long long v20 = *(_OWORD *)buf;
      if (*(void *)&buf[8]) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
      }
      v19[0] = 0;
      v19[1] = 0;
      char v10 = ML3ImportSession::addAlbumArtist((uint64_t)importSession, (uint64_t *)&v20, v19);
      if (v9) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
    }
    else
    {
      v12 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "skipping invalid album artist", v18, 2u);
      }

      char v10 = 1;
    }
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  else
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    char v10 = 0;
  }
  char v13 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = v14 - v6;
    _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "Import Metrics: Finished Processing Album Artist Import in %2f seconds", buf, 0xCu);
  }

  int64_t v15 = self->_processedArtistCount + 1;
  self->_processedArtistCount = v15;
  *(float *)&double v16 = (float)(self->_processedTrackCount + self->_processedContainerCount + v15 + self->_processedAlbumCount)
                 / (float)(self->_totalContainerCount
                         + self->_totalTrackCount
                         + self->_totalAlbumCount
                         + self->_totalArtistCount);
  [(ML3DAAPImportOperation *)self updateImportProgress:v16];
  return v10;
}

- (BOOL)_processArtistCount:(int)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  self->_totalArtistCount += a3;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_importSessionStarted) {
      double v5 = "yes";
    }
    else {
      double v5 = "no";
    }
    int64_t totalTrackCount = self->_totalTrackCount;
    int64_t totalArtistCount = self->_totalArtistCount;
    int64_t totalAlbumCount = self->_totalAlbumCount;
    int64_t totalContainerCount = self->_totalContainerCount;
    int updateType = self->_updateType;
    int v12 = 136316418;
    char v13 = v5;
    __int16 v14 = 2048;
    int64_t v15 = totalTrackCount;
    __int16 v16 = 2048;
    int64_t v17 = totalArtistCount;
    __int16 v18 = 2048;
    int64_t v19 = totalAlbumCount;
    __int16 v20 = 2048;
    int64_t v21 = totalContainerCount;
    __int16 v22 = 1024;
    int v23 = updateType;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "updating entity counts for import session: sessionStarted=%s, %lld tracks, %lld artists, %lld albums, %lld containers for update type %d", (uint8_t *)&v12, 0x3Au);
  }

  return 1;
}

- (BOOL)_processAlbumCount:(int)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  self->_totalAlbumCount += a3;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_importSessionStarted) {
      double v5 = "yes";
    }
    else {
      double v5 = "no";
    }
    int64_t totalTrackCount = self->_totalTrackCount;
    int64_t totalArtistCount = self->_totalArtistCount;
    int64_t totalAlbumCount = self->_totalAlbumCount;
    int64_t totalContainerCount = self->_totalContainerCount;
    int updateType = self->_updateType;
    int v12 = 136316418;
    char v13 = v5;
    __int16 v14 = 2048;
    int64_t v15 = totalTrackCount;
    __int16 v16 = 2048;
    int64_t v17 = totalArtistCount;
    __int16 v18 = 2048;
    int64_t v19 = totalAlbumCount;
    __int16 v20 = 2048;
    int64_t v21 = totalContainerCount;
    __int16 v22 = 1024;
    int v23 = updateType;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "updating entity counts for import session: sessionStarted=%s, %lld tracks, %lld artists, %lld albums, %lld containers for update type %d", (uint8_t *)&v12, 0x3Au);
  }

  return 1;
}

- (BOOL)_startImportSessionIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_importSessionStarted) {
    return 1;
  }
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t totalTrackCount = self->_totalTrackCount;
    int64_t totalArtistCount = self->_totalArtistCount;
    int64_t totalAlbumCount = self->_totalAlbumCount;
    int64_t totalContainerCount = self->_totalContainerCount;
    int updateType = self->_updateType;
    BOOL clientInitiatedReset = self->_clientInitiatedReset;
    int v11 = 134219264;
    int64_t v12 = totalTrackCount;
    __int16 v13 = 2048;
    int64_t v14 = totalArtistCount;
    __int16 v15 = 2048;
    int64_t v16 = totalAlbumCount;
    __int16 v17 = 2048;
    int64_t v18 = totalContainerCount;
    __int16 v19 = 1024;
    int v20 = updateType;
    __int16 v21 = 1024;
    BOOL v22 = clientInitiatedReset;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "starting import session with %lld tracks, %lld artists, %lld albums, %lld containers for update type %d, clientInitiatedReset=%d", (uint8_t *)&v11, 0x36u);
  }

  BOOL result = ML3ImportSession::begin((ML3ImportSession *)self->_importSession, LODWORD(self->_totalContainerCount)+ LODWORD(self->_totalTrackCount)+ LODWORD(self->_totalArtistCount)+ LODWORD(self->_totalAlbumCount), self->_updateType == 0, self->_clientInitiatedReset);
  self->_importSessionStarted = 1;
  return result;
}

- (BOOL)_processDeletedArtistId:(const void *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(ML3DAAPImportOperation *)self _startImportSessionIfNeeded])
  {
    [(ML3DAAPImportOperation *)self albumArtistItemFromDeletedDAAPArtistEntity:a3];
    if ((*(unsigned int (**)(uint64_t))(*(void *)v15 + 16))(v15))
    {
      importSession = self->_importSession;
      double v6 = v16;
      v14[0] = v15;
      v14[1] = (uint64_t)v16;
      if (v16) {
        atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v7 = ML3ImportSession::removeAlbumArtist((uint64_t)importSession, v14);
      if (v6) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      }
    }
    else
    {
      v9 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        (*(void (**)(void **__return_ptr))(*(void *)v15 + 88))(__p);
        char v10 = v13 >= 0 ? __p : (void **)__p[0];
        *(_DWORD *)buf = 136446210;
        int64_t v18 = v10;
        _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, "skip deleting invalid albumArtist=%{public}s", buf, 0xCu);
        if (v13 < 0) {
          operator delete(__p[0]);
        }
      }

      char v7 = 1;
    }
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }
  else
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "failed to start import session", (uint8_t *)__p, 2u);
    }

    return 0;
  }
  return v7;
}

- (BOOL)_processDeletedAlbumId:(const void *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(ML3DAAPImportOperation *)self _startImportSessionIfNeeded])
  {
    [(ML3DAAPImportOperation *)self albumItemFromDeletedDAAPAlbumEntity:a3];
    if (!(*(unsigned int (**)())(*(void *)v20 + 16))())
    {
      char v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        (*(void (**)(unsigned char *__return_ptr))(*(void *)v20 + 88))(buf);
        int64_t v14 = v27 >= 0 ? buf : *(unsigned char **)buf;
        *(_DWORD *)int v28 = 136446210;
        *(void *)&v28[4] = v14;
        _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_ERROR, "skip deleting invalid album=%{public}s", v28, 0xCu);
        if (v27 < 0) {
          operator delete(*(void **)buf);
        }
      }

      char v12 = 1;
      goto LABEL_46;
    }
    importSession = (id *)self->_importSession;
    if (v21) {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (*((_DWORD *)importSession + 8) == 2)
    {
      if (([importSession[260] count] || importSession[284])
        && !ML3ImportSession::flush((ML3ImportSession *)importSession, 1))
      {
        char v12 = 0;
        goto LABEL_44;
      }
      *(void *)int v28 = v20;
      *(void *)&v28[8] = v21;
      if (v21) {
        atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t AlbumPersistentID = ML3ImportSession::_getAlbumPersistentID((uint64_t)importSession, (uint64_t)v28, 0);
      if (v21) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v21);
      }
      if (AlbumPersistentID)
      {
        id v7 = importSession[286];
        v8 = [NSNumber numberWithLongLong:AlbumPersistentID];
        [v7 addObject:v8];

        ++*((_DWORD *)importSession + 55);
        v9 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [importSession[286] count];
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = AlbumPersistentID;
          __int16 v25 = 2048;
          uint64_t v26 = v10;
          _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "removing albumPID=%lld, _deletedAlbums count=%ld", buf, 0x16u);
        }
      }
      else
      {
        v9 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          (*(void (**)(unsigned char *__return_ptr))(*(void *)v20 + 88))(buf);
          int64_t v18 = v27 >= 0 ? buf : *(unsigned char **)buf;
          *(_DWORD *)BOOL v22 = 136446210;
          uint64_t v23 = v18;
          _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "not removing album=%{public}s", v22, 0xCu);
          if (v27 < 0) {
            operator delete(*(void **)buf);
          }
        }
      }

      if ((unint64_t)[importSession[286] count] > 0x3E7 || importSession[284])
      {
        char v12 = ML3ImportSession::flush((ML3ImportSession *)importSession, 1);
LABEL_44:
        if (v21) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v21);
        }
LABEL_46:
        if (v21) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v21);
        }
        return v12;
      }
    }
    else
    {
      *((unsigned char *)importSession + 1521) = 1;
      uint64_t v15 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        (*(void (**)(unsigned char *__return_ptr))(*(void *)v20 + 88))(buf);
        int64_t v16 = v27 >= 0 ? buf : *(unsigned char **)buf;
        int v17 = *((_DWORD *)importSession + 8);
        *(_DWORD *)int v28 = 136446466;
        *(void *)&v28[4] = v16;
        *(_WORD *)&v28[12] = 1024;
        *(_DWORD *)&v28[14] = v17;
        _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_ERROR, "not removing album=%{public}s as it's not supported for source=%d", v28, 0x12u);
        if (v27 < 0) {
          operator delete(*(void **)buf);
        }
      }
    }
    char v12 = 1;
    goto LABEL_44;
  }
  int v11 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
  }

  return 0;
}

- (BOOL)_processPersonElement:(shared_ptr<ML3CPP::Element>)a3
{
  var0 = a3.var0;
  BOOL v5 = [(ML3DAAPImportOperation *)self _startImportSessionIfNeeded];
  if (v5)
  {
    double v6 = (std::__shared_weak_count *)*((void *)var0 + 1);
    uint64_t v12 = *(void *)var0;
    char v13 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(ML3DAAPImportOperation *)self personImportItemFromDAAPElement:&v12];
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    importSession = self->_importSession;
    v8 = v15;
    v11[0] = *(void *)buf;
    v11[1] = (uint64_t)v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ML3ImportSession::addPerson((uint64_t)importSession, v11);
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }
  }
  return v5;
}

- (BOOL)_processDeletedContainerId:(int64_t)a3
{
  if ([(ML3DAAPImportOperation *)self _startImportSessionIfNeeded]) {
    operator new();
  }
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
  }

  return 0;
}

- (BOOL)_processContainerElement:(shared_ptr<ML3CPP:(vector<long)long :(std:()vector<std:(std::allocator<std::unordered_set<std::string>>> *)a5 :unordered_set<std::string> :allocator<long long>> *)a4 Element>)a3 withTrackIds:trackPersonIdentifiers:
{
  var1 = a3.var1;
  var0 = a3.var0;
  if ([(ML3DAAPImportOperation *)self _startImportSessionIfNeeded])
  {
    v9 = (std::__shared_weak_count *)*((void *)var0 + 1);
    uint64_t v24 = *(void *)var0;
    __int16 v25 = v9;
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::string __p = 0;
    BOOL v22 = 0;
    uint64_t v23 = 0;
    std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, *(const void **)var1, *((void *)var1 + 1), (uint64_t)(*((void *)var1 + 1) - *(void *)var1) >> 3);
    memset(v20, 0, sizeof(v20));
    std::vector<std::unordered_set<std::string>>::__init_with_size[abi:ne180100]<std::unordered_set<std::string>*,std::unordered_set<std::string>*>((uint64_t)v20, (uint64_t)a4->__begin_, (uint64_t)a4->__end_, 0xCCCCCCCCCCCCCCCDLL * (a4->__end_ - a4->__begin_));
    [(ML3DAAPImportOperation *)self containerImportItemFromDAAPElement:&v24 withTrackIds:&__p trackPersonIdentifiers:v20];
    *(void *)int v28 = v20;
    std::vector<std::unordered_set<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)v28);
    if (__p)
    {
      BOOL v22 = __p;
      operator delete(__p);
    }
    if (v25) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v25);
    }
    if ((*(unsigned int (**)(void))(**(void **)buf + 16))(*(void *)buf))
    {
      importSession = self->_importSession;
      int v11 = v27;
      uint64_t v18 = *(void *)buf;
      uint64_t v19 = v27;
      if (v27) {
        atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v12 = ML3ImportSession::addContainer((uint64_t)importSession, &v18);
      if (v11) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      }
    }
    else
    {
      uint64_t v15 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v28 = 0;
        _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "skipping invalid container", v28, 2u);
      }

      char v12 = 1;
    }
    int64_t v16 = self->_processedContainerCount + 1;
    self->_processedContainerCount = v16;
    *(float *)&double v13 = (float)(self->_processedTrackCount + self->_processedAlbumCount + v16 + self->_processedArtistCount)
                   / (float)(self->_totalContainerCount
                           + self->_totalTrackCount
                           + self->_totalAlbumCount
                           + self->_totalArtistCount);
    -[ML3DAAPImportOperation updateImportProgress:](self, "updateImportProgress:", v13, v18, v19);
    if (v27) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v27);
    }
  }
  else
  {
    int64_t v14 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    return 0;
  }
  return v12;
}

- (BOOL)_processContainerItemCount:(int)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  self->_totalContainerCount += a3;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_importSessionStarted) {
      BOOL v5 = "yes";
    }
    else {
      BOOL v5 = "no";
    }
    int64_t totalTrackCount = self->_totalTrackCount;
    int64_t totalArtistCount = self->_totalArtistCount;
    int64_t totalAlbumCount = self->_totalAlbumCount;
    int64_t totalContainerCount = self->_totalContainerCount;
    int updateType = self->_updateType;
    int v12 = 136316418;
    double v13 = v5;
    __int16 v14 = 2048;
    int64_t v15 = totalTrackCount;
    __int16 v16 = 2048;
    int64_t v17 = totalArtistCount;
    __int16 v18 = 2048;
    int64_t v19 = totalAlbumCount;
    __int16 v20 = 2048;
    int64_t v21 = totalContainerCount;
    __int16 v22 = 1024;
    int v23 = updateType;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "updating entity counts for import session: sessionStarted=%s, %lld tracks, %lld artists, %lld albums, %lld containers for update type %d", (uint8_t *)&v12, 0x3Au);
  }

  return 1;
}

- (BOOL)_processDeletedTrackId:(int64_t)a3
{
  if ([(ML3DAAPImportOperation *)self _startImportSessionIfNeeded]) {
    operator new();
  }
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
  }

  return 0;
}

- (BOOL)_processTrackImportItem:(shared_ptr<ML3DAAPImportItem>)a3
{
  var0 = a3.var0;
  if ([(ML3DAAPImportOperation *)self _startImportSessionIfNeeded])
  {
    if ((*(unsigned int (**)(void))(**(void **)var0 + 16))())
    {
      importSession = self->_importSession;
      double v6 = (std::__shared_weak_count *)*((void *)var0 + 1);
      uint64_t v13 = *(void *)var0;
      __int16 v14 = v6;
      if (v6) {
        atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v7 = ML3ImportSession::addTrack((uint64_t)importSession, &v13, 1);
      if (v6) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      }
    }
    else
    {
      uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "skipping invalid track", buf, 2u);
      }

      char v7 = 1;
    }
    int64_t v11 = self->_processedTrackCount + 1;
    self->_processedTrackCount = v11;
    *(float *)&double v8 = (float)(self->_processedContainerCount
                          + self->_processedAlbumCount
                          + v11
                          + self->_processedArtistCount)
                  / (float)(self->_totalContainerCount
                          + self->_totalTrackCount
                          + self->_totalAlbumCount
                          + self->_totalArtistCount);
    -[ML3DAAPImportOperation updateImportProgress:](self, "updateImportProgress:", v8, v13, v14);
  }
  else
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    return 0;
  }
  return v7;
}

- (BOOL)_processTrackElement:(shared_ptr<ML3CPP::Element>)a3
{
  var0 = a3.var0;
  if ([(ML3DAAPImportOperation *)self _startImportSessionIfNeeded])
  {
    BOOL v5 = (std::__shared_weak_count *)*((void *)var0 + 1);
    uint64_t v16 = *(void *)var0;
    int64_t v17 = v5;
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(ML3DAAPImportOperation *)self importItemFromDAAPElement:&v16];
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    }
    if ((*(unsigned int (**)(void))(**(void **)buf + 16))(*(void *)buf))
    {
      importSession = self->_importSession;
      char v7 = v19;
      v15[0] = *(void *)buf;
      v15[1] = (uint64_t)v19;
      if (v19) {
        atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v8 = ML3ImportSession::addTrack((uint64_t)importSession, v15, 0);
      if (v7) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      }
    }
    else
    {
      int64_t v11 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v14 = 0;
        _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "skipping invalid track", v14, 2u);
      }

      char v8 = 1;
    }
    int64_t v12 = self->_processedTrackCount + 1;
    self->_processedTrackCount = v12;
    *(float *)&double v9 = (float)(self->_processedContainerCount
                          + self->_processedAlbumCount
                          + v12
                          + self->_processedArtistCount)
                  / (float)(self->_totalContainerCount
                          + self->_totalTrackCount
                          + self->_totalAlbumCount
                          + self->_totalArtistCount);
    [(ML3DAAPImportOperation *)self updateImportProgress:v9];
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    }
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "failed to start import session", buf, 2u);
    }

    return 0;
  }
  return v8;
}

- (BOOL)_processTrackItemCount:(int)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  self->_totalTrackCount += a3;
  v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_importSessionStarted) {
      BOOL v5 = "yes";
    }
    else {
      BOOL v5 = "no";
    }
    int64_t totalTrackCount = self->_totalTrackCount;
    int64_t totalArtistCount = self->_totalArtistCount;
    int64_t totalAlbumCount = self->_totalAlbumCount;
    int64_t totalContainerCount = self->_totalContainerCount;
    int updateType = self->_updateType;
    int v12 = 136316418;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    int64_t v15 = totalTrackCount;
    __int16 v16 = 2048;
    int64_t v17 = totalArtistCount;
    __int16 v18 = 2048;
    int64_t v19 = totalAlbumCount;
    __int16 v20 = 2048;
    int64_t v21 = totalContainerCount;
    __int16 v22 = 1024;
    int v23 = updateType;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "updating entity counts for import session: sessionStarted=%s, %lld tracks, %lld artists, %lld albums, %lld containers for update type %d", (uint8_t *)&v12, 0x3Au);
  }

  return 1;
}

- (BOOL)_processUpdateType:(unsigned __int8)a3
{
  self->_int updateType = a3;
  return 1;
}

- (void)_finishParsingWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = (NSError *)a3;
  BOOL v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    char v8 = v4;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "parsing finished. error=%{public}@", (uint8_t *)&v7, 0xCu);
  }

  importError = self->_importError;
  self->_importError = v4;
}

- (BOOL)_importDAAPPayloadFromFile:(id)a3
{
  v18[19] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 fileSystemRepresentation];
  std::ifstream::basic_ifstream(v16);
  BOOL v5 = (char *)operator new(0x68uLL);
  *(_OWORD *)(v5 + 8) = 0u;
  *(void *)BOOL v5 = &unk_1F08C78E0;
  *((void *)v5 + 3) = v16;
  *((_OWORD *)v5 + 2) = 0u;
  v5[48] = 0;
  *(_OWORD *)(v5 + 52) = 0u;
  *(_OWORD *)(v5 + 68) = 0u;
  *(_OWORD *)(v5 + 84) = 0u;
  *((_DWORD *)v5 + 25) = 0;
  double v6 = (std::__shared_weak_count *)operator new(0xD8uLL);
  v6->__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C7598;
  ptr = (DAAPParserDelegate *)&v6[1];
  v15[0] = v5 + 24;
  v15[1] = v5;
  atomic_fetch_add_explicit((atomic_ullong *volatile)v5 + 1, 1uLL, memory_order_relaxed);
  DAAPParserDelegate::DAAPParserDelegate((uint64_t)&v6[1], self, v15);
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v5);
  p_delegate = &self->_delegate;
  cntrl = (std::__shared_weak_count *)p_delegate->__cntrl_;
  p_delegate->__ptr_ = (DAAPParserDelegate *)&v6[1];
  p_delegate->__cntrl_ = (__shared_weak_count *)v6;
  if (!cntrl)
  {
    BOOL v10 = 0;
    goto LABEL_5;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  ptr = p_delegate->__ptr_;
  double v6 = (std::__shared_weak_count *)p_delegate->__cntrl_;
  BOOL v10 = v6 == 0;
  if (v6)
  {
LABEL_5:
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  int64_t v11 = (std::__shared_weak_count *)*((void *)v5 + 5);
  *((void *)v5 + 4) = ptr;
  *((void *)v5 + 5) = v6;
  if (v11) {
    std::__shared_weak_count::__release_weak(v11);
  }
  if (!v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  ML3CPP::Parser::parse((ML3CPP::Parser *)(v5 + 24));
  int v12 = (std::__shared_weak_count *)*((void *)v5 + 5);
  *((void *)v5 + 4) = 0;
  *((void *)v5 + 5) = 0;
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)((char *)v16 + *(void *)(v16[0] - 24)), *(_DWORD *)&v17[*(void *)(v16[0] - 24) + 16] | 4);
  }
  uint64_t v13 = (std::__shared_weak_count *)p_delegate->__cntrl_;
  p_delegate->__ptr_ = 0;
  p_delegate->__cntrl_ = 0;
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v5);
  v16[0] = *MEMORY[0x1E4FBA3F8];
  *(uint64_t *)((char *)v16 + *(void *)(v16[0] - 24)) = *(void *)(MEMORY[0x1E4FBA3F8] + 24);
  MEMORY[0x1B3E93430](v17);
  std::istream::~istream();
  MEMORY[0x1B3E935B0](v18);

  return 1;
}

- (BOOL)_importDAAPPayloadFromFile:(id)a3 entityType:(int)a4
{
  v20[19] = *MEMORY[0x1E4F143B8];
  int v17 = a4;
  id v5 = a3;
  [v5 fileSystemRepresentation];
  std::ifstream::basic_ifstream(v18);
  double v6 = (char *)operator new(0x68uLL);
  *(_OWORD *)(v6 + 8) = 0u;
  *(void *)double v6 = &unk_1F08C78E0;
  *((void *)v6 + 3) = v18;
  *((_OWORD *)v6 + 2) = 0u;
  v6[48] = 0;
  *(_OWORD *)(v6 + 52) = 0u;
  *(_OWORD *)(v6 + 68) = 0u;
  *(_OWORD *)(v6 + 84) = 0u;
  *((_DWORD *)v6 + 25) = 0;
  char v16 = 0;
  int v7 = (std::__shared_weak_count *)operator new(0xD8uLL);
  v7->__shared_owners_ = 0;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C7598;
  ptr = (DAAPParserDelegate *)&v7[1];
  std::allocator<DAAPParserDelegate>::construct[abi:ne180100]<DAAPParserDelegate,ML3DAAPImportOperation * const {__strong}&,std::shared_ptr<ML3CPP::Parser> &,ML3DAAPImportOperationEntityType &,BOOL>((uint64_t)&v7[1], self, (uint64_t)(v6 + 24), (std::__shared_weak_count *)v6, (unsigned int *)&v17, &v16);
  p_delegate = &self->_delegate;
  cntrl = (std::__shared_weak_count *)p_delegate->__cntrl_;
  p_delegate->__ptr_ = (DAAPParserDelegate *)&v7[1];
  p_delegate->__cntrl_ = (__shared_weak_count *)v7;
  if (!cntrl)
  {
    BOOL v11 = 0;
    goto LABEL_5;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  ptr = p_delegate->__ptr_;
  int v7 = (std::__shared_weak_count *)p_delegate->__cntrl_;
  BOOL v11 = v7 == 0;
  if (v7)
  {
LABEL_5:
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  int v12 = (std::__shared_weak_count *)*((void *)v6 + 5);
  *((void *)v6 + 4) = ptr;
  *((void *)v6 + 5) = v7;
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
  if (!v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  ML3CPP::Parser::parse((ML3CPP::Parser *)(v6 + 24));
  uint64_t v13 = (std::__shared_weak_count *)*((void *)v6 + 5);
  *((void *)v6 + 4) = 0;
  *((void *)v6 + 5) = 0;
  if (v13) {
    std::__shared_weak_count::__release_weak(v13);
  }
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)((char *)v18 + *(void *)(v18[0] - 24)), *(_DWORD *)&v19[*(void *)(v18[0] - 24) + 16] | 4);
  }
  __int16 v14 = (std::__shared_weak_count *)p_delegate->__cntrl_;
  p_delegate->__ptr_ = 0;
  p_delegate->__cntrl_ = 0;
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  v18[0] = *MEMORY[0x1E4FBA3F8];
  *(uint64_t *)((char *)v18 + *(void *)(v18[0] - 24)) = *(void *)(MEMORY[0x1E4FBA3F8] + 24);
  MEMORY[0x1B3E93430](v19);
  std::istream::~istream();
  MEMORY[0x1B3E935B0](v20);

  return 1;
}

- (BOOL)_preprocessDAAPPayloadFromFile:(id)a3 entityType:(int)a4
{
  v20[19] = *MEMORY[0x1E4F143B8];
  int v17 = a4;
  id v5 = a3;
  [v5 fileSystemRepresentation];
  std::ifstream::basic_ifstream(v18);
  double v6 = (char *)operator new(0x68uLL);
  *(_OWORD *)(v6 + 8) = 0u;
  *(void *)double v6 = &unk_1F08C78E0;
  *((void *)v6 + 3) = v18;
  *((_OWORD *)v6 + 2) = 0u;
  v6[48] = 0;
  *(_OWORD *)(v6 + 52) = 0u;
  *(_OWORD *)(v6 + 68) = 0u;
  *(_OWORD *)(v6 + 84) = 0u;
  *((_DWORD *)v6 + 25) = 0;
  char v16 = 1;
  int v7 = (std::__shared_weak_count *)operator new(0xD8uLL);
  v7->__shared_owners_ = 0;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C7598;
  ptr = (DAAPParserDelegate *)&v7[1];
  std::allocator<DAAPParserDelegate>::construct[abi:ne180100]<DAAPParserDelegate,ML3DAAPImportOperation * const {__strong}&,std::shared_ptr<ML3CPP::Parser> &,ML3DAAPImportOperationEntityType &,BOOL>((uint64_t)&v7[1], self, (uint64_t)(v6 + 24), (std::__shared_weak_count *)v6, (unsigned int *)&v17, &v16);
  p_delegate = &self->_delegate;
  cntrl = (std::__shared_weak_count *)p_delegate->__cntrl_;
  p_delegate->__ptr_ = (DAAPParserDelegate *)&v7[1];
  p_delegate->__cntrl_ = (__shared_weak_count *)v7;
  if (!cntrl)
  {
    BOOL v11 = 0;
    goto LABEL_5;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  ptr = p_delegate->__ptr_;
  int v7 = (std::__shared_weak_count *)p_delegate->__cntrl_;
  BOOL v11 = v7 == 0;
  if (v7)
  {
LABEL_5:
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  int v12 = (std::__shared_weak_count *)*((void *)v6 + 5);
  *((void *)v6 + 4) = ptr;
  *((void *)v6 + 5) = v7;
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
  if (!v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  ML3CPP::Parser::parse((ML3CPP::Parser *)(v6 + 24));
  uint64_t v13 = (std::__shared_weak_count *)*((void *)v6 + 5);
  *((void *)v6 + 4) = 0;
  *((void *)v6 + 5) = 0;
  if (v13) {
    std::__shared_weak_count::__release_weak(v13);
  }
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)((char *)v18 + *(void *)(v18[0] - 24)), *(_DWORD *)&v19[*(void *)(v18[0] - 24) + 16] | 4);
  }
  __int16 v14 = (std::__shared_weak_count *)p_delegate->__cntrl_;
  p_delegate->__ptr_ = 0;
  p_delegate->__cntrl_ = 0;
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  v18[0] = *MEMORY[0x1E4FBA3F8];
  *(uint64_t *)((char *)v18 + *(void *)(v18[0] - 24)) = *(void *)(MEMORY[0x1E4FBA3F8] + 24);
  MEMORY[0x1B3E93430](v19);
  std::istream::~istream();
  MEMORY[0x1B3E935B0](v20);

  return 1;
}

- (shared_ptr<ML3DAAPDeleteImportItem>)albumItemFromDeletedDAAPAlbumEntity:(const void *)a3
{
  void *v3 = 0;
  v3[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (ML3DAAPDeleteImportItem *)self;
  return result;
}

- (shared_ptr<ML3DAAPDeleteImportItem>)albumArtistItemFromDeletedDAAPArtistEntity:(const void *)a3
{
  void *v3 = 0;
  v3[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (ML3DAAPDeleteImportItem *)self;
  return result;
}

- (shared_ptr<ML3DAAPImportItem>)albumArtistImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
  void *v3 = 0;
  v3[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (ML3DAAPImportItem *)self;
  return result;
}

- (shared_ptr<ML3DAAPImportItem>)albumImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
  void *v3 = 0;
  v3[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (ML3DAAPImportItem *)self;
  return result;
}

- (shared_ptr<ML3DAAPImportItem>)artistImportItemFromDAAPTrackElement:(shared_ptr<ML3CPP:(int64_t)a4 :Element>)a3 artistEntityType:
{
}

- (shared_ptr<ML3DAAPImportItem>)albumImportItemFromDAAPTrackElement:(shared_ptr<ML3CPP::Element>)a3
{
}

- (shared_ptr<ML3DAAPImportItem>)personImportItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
}

- (shared_ptr<ML3DAAPImportItem>)containerImportItemFromDAAPElement:(shared_ptr<ML3CPP:(vector<long)long :(std:()vector<std:(std::allocator<std::unordered_set<std::string>>> *)a5 :unordered_set<std::string> :allocator<long long>> *)a4 Element>)a3 withTrackIds:trackPersonIdentifiers:
{
}

- (shared_ptr<ML3DAAPImportItem>)importItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
}

- (BOOL)performImportOfSourceType:(int)a3 usingConnection:(id)a4
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v92 = a4;
  self->_sourceType = a3;
  self->_BOOL clientInitiatedReset = 0;
  v102 = self;
  v95 = [(ML3ImportOperation *)self import];
  v93 = [v95 library];
  v101 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (_os_feature_enabled_impl())
  {
    if (self->_sourceType == 2)
    {
      double v6 = [(ML3ImportOperation *)self import];
      self->_BOOL clientInitiatedReset = [v6 clientInitiatedReset];

      int v7 = [v95 albumData];
      char v8 = (void *)[v7 length];

      if (v8)
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F28F98];
        BOOL v10 = [v95 albumData];
        id v130 = 0;
        char v8 = [v9 propertyListWithData:v10 options:0 format:0 error:&v130];
        id v11 = v130;

        if (v11)
        {
          int v12 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v137 = (uint64_t)v11;
            _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "Failed to deserialize album data with error: %{public}@", buf, 0xCu);
          }

          BOOL v94 = 0;
        }
        else
        {
          BOOL v94 = 1;
        }
      }
      else
      {
        BOOL v94 = 1;
      }
      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      id v96 = v8;
      uint64_t v41 = [v96 countByEnumeratingWithState:&v126 objects:v140 count:16];
      if (v41)
      {
        int v98 = 0;
        uint64_t v42 = *(void *)v127;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v127 != v42) {
              objc_enumerationMutation(v96);
            }
            uint64_t v44 = *(void **)(*((void *)&v126 + 1) + 8 * i);
            uint64_t v45 = [v101 attributesOfItemAtPath:v44 error:0];
            uint64_t v46 = [v45 fileSize];

            uint64_t v47 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              uint64_t v137 = v46;
              __int16 v138 = 2114;
              uint64_t v139 = (uint64_t)v44;
              _os_log_impl(&dword_1B022D000, v47, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of album data from: %{public}@", buf, 0x16u);
            }

            [(ML3DAAPImportOperation *)v102 _preprocessDAAPPayloadFromFile:v44 entityType:0];
            v98 |= v46 != 0;
          }
          uint64_t v41 = [v96 countByEnumeratingWithState:&v126 objects:v140 count:16];
        }
        while (v41);
      }
      else
      {
        int v98 = 0;
      }

      uint64_t v48 = [v95 albumArtistData];
      BOOL v49 = [v48 length] == 0;

      if (v49)
      {
        v52 = 0;
      }
      else
      {
        std::string::size_type v50 = (void *)MEMORY[0x1E4F28F98];
        v51 = [v95 albumArtistData];
        id v125 = 0;
        v52 = [v50 propertyListWithData:v51 options:0 format:0 error:&v125];
        id v53 = v125;

        if (v53)
        {
          unint64_t v54 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v137 = (uint64_t)v53;
            _os_log_impl(&dword_1B022D000, v54, OS_LOG_TYPE_DEFAULT, "Failed to deserialize artist data with error: %{public}@", buf, 0xCu);
          }

          BOOL v94 = 0;
        }
      }
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v97 = v52;
      int v19 = 0;
      uint64_t v55 = [v97 countByEnumeratingWithState:&v121 objects:v135 count:16];
      if (v55)
      {
        uint64_t v56 = *(void *)v122;
        do
        {
          for (uint64_t j = 0; j != v55; ++j)
          {
            if (*(void *)v122 != v56) {
              objc_enumerationMutation(v97);
            }
            v58 = *(void **)(*((void *)&v121 + 1) + 8 * j);
            uint64_t v59 = [v101 attributesOfItemAtPath:v58 error:0];
            uint64_t v60 = [v59 fileSize];

            uint64_t v61 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              uint64_t v137 = v60;
              __int16 v138 = 2114;
              uint64_t v139 = (uint64_t)v58;
              _os_log_impl(&dword_1B022D000, v61, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of artist data from: %{public}@", buf, 0x16u);
            }

            [(ML3DAAPImportOperation *)v102 _preprocessDAAPPayloadFromFile:v58 entityType:1];
            v19 |= v60 != 0;
          }
          uint64_t v55 = [v97 countByEnumeratingWithState:&v121 objects:v135 count:16];
        }
        while (v55);
      }
    }
    else
    {
      id v96 = 0;
      id v97 = 0;
      int v19 = 0;
      int v98 = 0;
      BOOL v94 = 1;
    }
    v62 = [v95 trackData];
    BOOL v63 = [v62 length] == 0;

    if (v63)
    {
      v66 = 0;
    }
    else
    {
      v64 = (void *)MEMORY[0x1E4F28F98];
      uint64_t v65 = [v95 trackData];
      id v120 = 0;
      v66 = [v64 propertyListWithData:v65 options:0 format:0 error:&v120];
      id v67 = v120;

      if (v67)
      {
        uint64_t v68 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v137 = (uint64_t)v67;
          _os_log_impl(&dword_1B022D000, v68, OS_LOG_TYPE_DEFAULT, "Failed to deserialize track data with error: %{public}@", buf, 0xCu);
        }

        BOOL v94 = 0;
      }
    }
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    obuint64_t j = v66;
    int v69 = 0;
    uint64_t v70 = [obj countByEnumeratingWithState:&v116 objects:v134 count:16];
    if (v70)
    {
      uint64_t v71 = *(void *)v117;
      do
      {
        for (uint64_t k = 0; k != v70; ++k)
        {
          if (*(void *)v117 != v71) {
            objc_enumerationMutation(obj);
          }
          uint64_t v73 = *(void *)(*((void *)&v116 + 1) + 8 * k);
          v74 = [v101 attributesOfItemAtPath:v73 error:0];
          uint64_t v75 = [v74 fileSize];

          v76 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v137 = v75;
            __int16 v138 = 2114;
            uint64_t v139 = v73;
            _os_log_impl(&dword_1B022D000, v76, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of track data from: %{public}@", buf, 0x16u);
          }

          [(ML3DAAPImportOperation *)v102 _preprocessDAAPPayloadFromFile:v73 entityType:2];
          v69 |= v75 != 0;
        }
        uint64_t v70 = [obj countByEnumeratingWithState:&v116 objects:v134 count:16];
      }
      while (v70);
    }

    v77 = [v95 playlistData];
    BOOL v78 = [v77 length] == 0;

    if (v78)
    {
      std::string v81 = 0;
    }
    else
    {
      v79 = (void *)MEMORY[0x1E4F28F98];
      char v80 = [v95 playlistData];
      std::string v81 = [v79 propertyListWithData:v80 options:0 format:0 error:0];
    }
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v99 = v81;
    int v82 = 0;
    uint64_t v83 = [v99 countByEnumeratingWithState:&v112 objects:v133 count:16];
    if (v83)
    {
      uint64_t v84 = *(void *)v113;
      do
      {
        for (uint64_t m = 0; m != v83; ++m)
        {
          if (*(void *)v113 != v84) {
            objc_enumerationMutation(v99);
          }
          v86 = *(void **)(*((void *)&v112 + 1) + 8 * m);
          if ([obj containsObject:v86])
          {
            v87 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v137 = (uint64_t)v86;
              _os_log_impl(&dword_1B022D000, v87, OS_LOG_TYPE_DEFAULT, "Skipping playlist import file '%{public}@' because it was already processed", buf, 0xCu);
            }
          }
          else
          {
            v88 = [v101 attributesOfItemAtPath:v86 error:0];
            uint64_t v89 = [v88 fileSize];

            v90 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              uint64_t v137 = v89;
              __int16 v138 = 2114;
              uint64_t v139 = (uint64_t)v86;
              _os_log_impl(&dword_1B022D000, v90, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of playlist data from: %{public}@", buf, 0x16u);
            }

            [(ML3DAAPImportOperation *)v102 _preprocessDAAPPayloadFromFile:v86 entityType:3];
            v82 |= v89 != 0;
          }
        }
        uint64_t v83 = [v99 countByEnumeratingWithState:&v112 objects:v133 count:16];
      }
      while (v83);
    }

    if (v94)
    {
      if ((v69 | v82 | v98 | v19)) {
        operator new();
      }
      LOBYTE(v94) = 1;
    }
  }
  else
  {
    uint64_t v13 = [v95 trackData];
    __int16 v14 = (void *)[v13 length];

    if (v14)
    {
      int64_t v15 = (void *)MEMORY[0x1E4F28F98];
      char v16 = [v95 trackData];
      id v111 = 0;
      __int16 v14 = [v15 propertyListWithData:v16 options:0 format:0 error:&v111];
      id v17 = v111;

      BOOL v94 = v17 == 0;
      if (v17)
      {
        __int16 v18 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v137 = (uint64_t)v17;
          _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "Failed to deserialize track data with error: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      BOOL v94 = 1;
    }
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    obuint64_t j = v14;
    uint64_t v20 = [obj countByEnumeratingWithState:&v107 objects:v132 count:16];
    int v21 = 0;
    if (v20)
    {
      uint64_t v22 = *(void *)v108;
      do
      {
        for (uint64_t n = 0; n != v20; ++n)
        {
          if (*(void *)v108 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void **)(*((void *)&v107 + 1) + 8 * n);
          __int16 v25 = [v101 attributesOfItemAtPath:v24 error:0];
          uint64_t v26 = [v25 fileSize];

          char v27 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v137 = v26;
            __int16 v138 = 2114;
            uint64_t v139 = (uint64_t)v24;
            _os_log_impl(&dword_1B022D000, v27, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of track data from: %{public}@", buf, 0x16u);
          }

          [(ML3DAAPImportOperation *)v102 _preprocessDAAPPayloadFromFile:v24 entityType:2];
          v21 |= v26 != 0;
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v107 objects:v132 count:16];
      }
      while (v20);
    }

    int v28 = [v95 playlistData];
    BOOL v29 = [v28 length] == 0;

    if (v29)
    {
      int v32 = 0;
    }
    else
    {
      int v30 = (void *)MEMORY[0x1E4F28F98];
      v31 = [v95 playlistData];
      int v32 = [v30 propertyListWithData:v31 options:0 format:0 error:0];
    }
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v99 = v32;
    int v33 = 0;
    uint64_t v34 = [v99 countByEnumeratingWithState:&v103 objects:v131 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v104;
      do
      {
        for (uint64_t ii = 0; ii != v34; ++ii)
        {
          if (*(void *)v104 != v35) {
            objc_enumerationMutation(v99);
          }
          int v37 = *(void **)(*((void *)&v103 + 1) + 8 * ii);
          v38 = [v101 attributesOfItemAtPath:v37 error:0];
          uint64_t v39 = [v38 fileSize];

          v40 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v137 = v39;
            __int16 v138 = 2114;
            uint64_t v139 = (uint64_t)v37;
            _os_log_impl(&dword_1B022D000, v40, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of playlist data from: %{public}@", buf, 0x16u);
          }

          [(ML3DAAPImportOperation *)v102 _preprocessDAAPPayloadFromFile:v37 entityType:3];
          v33 |= v39 != 0;
        }
        uint64_t v34 = [v99 countByEnumeratingWithState:&v103 objects:v131 count:16];
      }
      while (v34);
    }

    if ((v94 & (v21 | v33)) == 1) {
      operator new();
    }
    id v96 = 0;
    id v97 = 0;
  }

  return v94;
}

- (void)dealloc
{
  importSessiouint64_t n = self->_importSession;
  if (importSession) {
    (*(void (**)(void *, SEL))(*(void *)importSession + 8))(importSession, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)ML3DAAPImportOperation;
  [(ML3DAAPImportOperation *)&v4 dealloc];
}

@end
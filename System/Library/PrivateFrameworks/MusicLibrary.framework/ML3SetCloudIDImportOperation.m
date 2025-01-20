@interface ML3SetCloudIDImportOperation
- (BOOL)_importPlaylistsUsingImportSession:(void *)a3;
- (BOOL)_importTracksUsingImportSession:(void *)a3;
- (BOOL)_performImportWithTransaction:(id)a3;
- (unint64_t)importSource;
- (void)main;
@end

@implementation ML3SetCloudIDImportOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistInfo, 0);

  objc_storeStrong((id *)&self->_trackInfo, 0);
}

- (BOOL)_importPlaylistsUsingImportSession:(void *)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_playlistInfo count])
  {
    v5 = (NSArray *)os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v65) = 0;
      _os_log_impl(&dword_1B022D000, &v5->super, OS_LOG_TYPE_ERROR, "[ML3SetCloudIDImportOperation] No playlists in cloud-id mapping payload, skipping playlist import.", (uint8_t *)&v65, 2u);
    }
    BOOL v7 = 1;
    goto LABEL_78;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v5 = self->_playlistInfo;
  obj = v5;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v56 objects:v61 count:16];
  BOOL v7 = 1;
  if (v6)
  {
    v53 = (char *)a3 + 2344;
    v54 = self;
    uint64_t v8 = *(void *)v57;
    char v9 = 1;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v57 != v8) {
        objc_enumerationMutation(obj);
      }
      v11 = *(NSDictionary **)(*((void *)&v56 + 1) + 8 * v10);
      v12 = (char *)operator new(0x68uLL);
      *((void *)v12 + 1) = 0;
      *((void *)v12 + 2) = 0;
      *(void *)v12 = &unk_1F08C7870;
      v13 = v12 + 24;
      ML3SetCloudIDImportItem::ML3SetCloudIDImportItem((ML3SetCloudIDImportItem *)(v12 + 24), v11);
      *((void *)v12 + 3) = &unk_1F08C60E8;
      v14 = [*((id *)v12 + 11) objectForKey:@"persistent-id"];
      *((void *)v12 + 4) = [v14 longLongValue];

      v15 = [*((id *)v12 + 11) objectForKey:@"cloud-id"];
      *((void *)v12 + 12) = [v15 longLongValue];

      int v16 = (*(uint64_t (**)(char *))(*((void *)v12 + 3) + 16))(v12 + 24);
      if (v16) {
        break;
      }
      v24 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        (*(void (**)(long long *__return_ptr, char *))(*(void *)v13 + 88))(&v65, v13);
        v25 = &v65;
        if (SHIBYTE(v66) < 0) {
          v25 = (long long *)v65;
        }
        LODWORD(v62) = 136315138;
        *(void *)((char *)&v62 + 4) = v25;
        _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_DEBUG, "[ML3SetCloudIDImportOperation] Skipping invalid playlist: %s", (uint8_t *)&v62, 0xCu);
        if (SHIBYTE(v66) < 0) {
          operator delete((void *)v65);
        }
      }
LABEL_32:

      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
      if (v16 == 1)
      {

        if (v9) {
          return 1;
        }
LABEL_70:
        v5 = (NSArray *)os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v65) = 0;
          _os_log_impl(&dword_1B022D000, &v5->super, OS_LOG_TYPE_ERROR, "[ML3SetCloudIDImportOperation] Failed to import playlists", (uint8_t *)&v65, 2u);
        }
        BOOL v7 = 0;
        goto LABEL_78;
      }
LABEL_33:
      if (++v10 == v6)
      {
        uint64_t v51 = [(NSArray *)obj countByEnumeratingWithState:&v56 objects:v61 count:16];
        uint64_t v6 = v51;
        if (!v51)
        {

          if ((v9 & 1) == 0) {
            goto LABEL_70;
          }
          return 1;
        }
        goto LABEL_4;
      }
    }
    atomic_fetch_add_explicit((atomic_ullong *volatile)v12 + 1, 1uLL, memory_order_relaxed);
    v17 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      (*(void (**)(long long *__return_ptr, char *))(*(void *)v13 + 88))(&v65, v13);
      v18 = &v65;
      if (SHIBYTE(v66) < 0) {
        v18 = (long long *)v65;
      }
      *(_DWORD *)buf = 136446210;
      v64 = v18;
      _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_DEFAULT, "updating container %{public}s", buf, 0xCu);
      if (SHIBYTE(v66) < 0) {
        operator delete((void *)v65);
      }
    }

    ++*((_DWORD *)a3 + 42);
    if (*((void *)a3 + 192) == *((void *)a3 + 191)
      && *((void *)a3 + 195) == *((void *)a3 + 194)
      && ![*((id *)a3 + 197) count]
      && *((void *)a3 + 291) == *((void *)a3 + 290)
      || ML3ImportSession::flush((ML3ImportSession *)a3, 0))
    {
      *(void *)&long long v62 = v12 + 24;
      *((void *)&v62 + 1) = v12;
      atomic_fetch_add_explicit((atomic_ullong *volatile)v12 + 1, 1uLL, memory_order_relaxed);
      uint64_t ContainerPersistentID = ML3ImportSession::_getContainerPersistentID((uint64_t)a3, &v62);
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
      if (!ContainerPersistentID)
      {
        v28 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = *((void *)v12 + 4);
          LODWORD(v65) = 134217984;
          *(void *)((char *)&v65 + 4) = v29;
          _os_log_impl(&dword_1B022D000, v28, OS_LOG_TYPE_ERROR, "updateContainer ignoring non-existing container with pid %lld", (uint8_t *)&v65, 0xCu);
        }

        goto LABEL_63;
      }
      v12[40] = 1;
      *((void *)v12 + 4) = ContainerPersistentID;
      v60[0] = (uint64_t)(v12 + 24);
      v60[1] = (uint64_t)v12;
      atomic_fetch_add_explicit((atomic_ullong *volatile)v12 + 1, 1uLL, memory_order_relaxed);
      int v20 = ML3ImportSession::_prepareContainerData((uint64_t)a3, v60);
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
      if (v20)
      {
        v21 = (uint64_t *)*((void *)a3 + 288);
        unint64_t v22 = *((void *)a3 + 289);
        if ((unint64_t)v21 >= v22)
        {
          v30 = (uint64_t *)*((void *)a3 + 287);
          uint64_t v31 = v21 - v30;
          unint64_t v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 61) {
            std::vector<long long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v33 = v22 - (void)v30;
          if (v33 >> 2 > v32) {
            unint64_t v32 = v33 >> 2;
          }
          BOOL v34 = (unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8;
          unint64_t v35 = 0x1FFFFFFFFFFFFFFFLL;
          if (!v34) {
            unint64_t v35 = v32;
          }
          if (v35)
          {
            unint64_t v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v35);
            v21 = (uint64_t *)*((void *)a3 + 288);
            v30 = (uint64_t *)*((void *)a3 + 287);
          }
          else
          {
            uint64_t v36 = 0;
          }
          v37 = (uint64_t *)(v35 + 8 * v31);
          uint64_t *v37 = ContainerPersistentID;
          v23 = v37 + 1;
          while (v21 != v30)
          {
            uint64_t v38 = *--v21;
            *--v37 = v38;
          }
          *((void *)a3 + 287) = v37;
          *((void *)a3 + 288) = v23;
          *((void *)a3 + 289) = v35 + 8 * v36;
          if (v30) {
            operator delete(v30);
          }
        }
        else
        {
          uint64_t *v21 = ContainerPersistentID;
          v23 = v21 + 1;
        }
        *((void *)a3 + 288) = v23;
        v39 = (char **)*((void *)a3 + 294);
        unint64_t v40 = *((void *)a3 + 295);
        if ((unint64_t)v39 >= v40)
        {
          uint64_t v42 = ((uint64_t)v39 - *v53) >> 4;
          unint64_t v43 = v42 + 1;
          if ((unint64_t)(v42 + 1) >> 60) {
            std::vector<long long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v44 = v40 - *v53;
          if (v44 >> 3 > v43) {
            unint64_t v43 = v44 >> 3;
          }
          if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v45 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v45 = v43;
          }
          v68 = (char *)a3 + 2360;
          v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<ML3ImportItem>>>(v45);
          *(void *)&long long v47 = v12 + 24;
          *((void *)&v47 + 1) = v12;
          v48 = &v46[16 * v42];
          *(void *)&long long v65 = v46;
          *((void *)&v65 + 1) = v48;
          v67 = &v46[16 * v49];
          *(_OWORD *)v48 = v47;
          atomic_fetch_add_explicit((atomic_ullong *volatile)v12 + 1, 1uLL, memory_order_relaxed);
          v66 = v48 + 16;
          std::vector<std::shared_ptr<ML3ImportItem>>::__swap_out_circular_buffer(v53, &v65);
          v41 = (void *)*((void *)a3 + 294);
          std::__split_buffer<std::shared_ptr<ML3ImportItem>>::~__split_buffer((uint64_t)&v65);
        }
        else
        {
          *v39 = v13;
          v39[1] = v12;
          atomic_fetch_add_explicit((atomic_ullong *volatile)v12 + 1, 1uLL, memory_order_relaxed);
          v41 = v39 + 2;
          *((void *)a3 + 294) = v39 + 2;
        }
        *((void *)a3 + 294) = v41;
        if (v41 != *((void **)a3 + 293))
        {
          char v50 = ML3ImportSession::flush((ML3ImportSession *)a3, 0);
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
          if (v50) {
            goto LABEL_64;
          }
LABEL_28:
          v24 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
LABEL_31:
            char v9 = 0;
            goto LABEL_32;
          }
          LOWORD(v65) = 0;
          v26 = v24;
          v27 = "[ML3SetCloudIDImportOperation] Failed to import playlist data";
LABEL_30:
          _os_log_impl(&dword_1B022D000, v26, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v65, 2u);
          goto LABEL_31;
        }
LABEL_63:
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
LABEL_64:
        if (([(ML3SetCloudIDImportOperation *)v54 isCancelled] & 1) == 0)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
          char v9 = 1;
          goto LABEL_33;
        }
        v24 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        LOWORD(v65) = 0;
        v26 = v24;
        v27 = "[ML3SetCloudIDImportOperation] Set-cloud-id import operation cancelled";
        goto LABEL_30;
      }
    }
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
    goto LABEL_28;
  }
LABEL_78:

  return v7;
}

- (BOOL)_importTracksUsingImportSession:(void *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_trackInfo count])
  {
    v4 = (NSArray *)os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_1B022D000, &v4->super, OS_LOG_TYPE_ERROR, "[ML3SetCloudIDImportOperation] No tracks in cloud-id mapping payload, skipping track import.", (uint8_t *)&__p, 2u);
    }
    goto LABEL_53;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v4 = self->_trackInfo;
  obj = v4;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (!v5)
  {
LABEL_53:
    BOOL v31 = 1;
    goto LABEL_54;
  }
  uint64_t v33 = self;
  uint64_t v6 = *(void *)v48;
  char v7 = 1;
LABEL_4:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v48 != v6) {
      objc_enumerationMutation(obj);
    }
    char v9 = *(NSDictionary **)(*((void *)&v47 + 1) + 8 * v8);
    uint64_t v10 = (char *)operator new(0x68uLL);
    *((void *)v10 + 1) = 0;
    *((void *)v10 + 2) = 0;
    *(void *)uint64_t v10 = &unk_1F08C7800;
    v11 = v10 + 24;
    ML3SetCloudIDImportItem::ML3SetCloudIDImportItem((ML3SetCloudIDImportItem *)(v10 + 24), v9);
    *((void *)v10 + 3) = &unk_1F08C5560;
    v12 = [*((id *)v10 + 11) objectForKey:@"persistent-id"];
    v13 = [MEMORY[0x1E4F28FE8] scannerWithString:v12];
    __p = 0;
    if ([v13 scanHexLongLong:&__p])
    {
      *((void *)v10 + 4) = __p;
      v14 = [*((id *)v10 + 11) objectForKey:@"cloud-id"];
      *((void *)v10 + 12) = [v14 longLongValue];
    }
    int v15 = (*(uint64_t (**)(char *))(*(void *)v11 + 16))(v11);
    if (v15)
    {
      if (!_os_feature_enabled_impl())
      {
        v39[0] = (uint64_t)(v10 + 24);
        v39[1] = (uint64_t)v10;
        atomic_fetch_add_explicit((atomic_ullong *volatile)v10 + 1, 1uLL, memory_order_relaxed);
        char updated = ML3ImportSession::updateTrack((uint64_t)a3, v39, 0, 1);
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
        if ((updated & 1) == 0)
        {
LABEL_36:
          v25 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
LABEL_39:
            char v7 = 0;
            goto LABEL_40;
          }
          LOWORD(__p) = 0;
          v28 = v25;
          uint64_t v29 = "[ML3SetCloudIDImportOperation] Failed to import track data";
LABEL_38:
          _os_log_impl(&dword_1B022D000, v28, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&__p, 2u);
          goto LABEL_39;
        }
LABEL_30:
        if (([(ML3SetCloudIDImportOperation *)v33 isCancelled] & 1) == 0)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
          char v7 = 1;
          goto LABEL_41;
        }
        v25 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
        LOWORD(__p) = 0;
        v28 = v25;
        uint64_t v29 = "[ML3SetCloudIDImportOperation] Set-cloud-id import operation cancelled";
        goto LABEL_38;
      }
      _ZNSt3__115allocate_sharedB8ne180100I29ML3SetCloudIDArtistImportItemNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&__p);
      int v16 = __p;
      v17 = (std::__shared_weak_count *)v37;
      v46[0] = (uint64_t)__p;
      v46[1] = v37;
      if (v37) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v37 + 8), 1uLL, memory_order_relaxed);
      }
      v45[0] = v10 + 24;
      v45[1] = v10;
      atomic_fetch_add_explicit((atomic_ullong *volatile)v10 + 1, 1uLL, memory_order_relaxed);
      int v18 = ML3ImportSession::updateAlbumArtist((uint64_t)a3, v46, v45, 1);
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
      if (v17) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      }
      if (!v18) {
        goto LABEL_33;
      }
      _ZNSt3__115allocate_sharedB8ne180100I29ML3SetCloudIDArtistImportItemNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&buf);
      v19 = (std::__shared_weak_count *)*((void *)&buf + 1);
      long long v44 = buf;
      if (*((void *)&buf + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&buf + 1) + 8), 1uLL, memory_order_relaxed);
      }
      v43[0] = v10 + 24;
      v43[1] = v10;
      atomic_fetch_add_explicit((atomic_ullong *volatile)v10 + 1, 1uLL, memory_order_relaxed);
      int v20 = ML3ImportSession::updateItemArtist((uint64_t)a3, &v44, v43, 1);
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
      if (v19)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v19);
        std::__shared_weak_count::__release_shared[abi:ne180100](v19);
      }
      if (!v20) {
        goto LABEL_33;
      }
      v21 = (std::__shared_weak_count *)operator new(0x68uLL);
      v21->__shared_weak_owners_ = 0;
      v21->__shared_owners_ = 0;
      v21->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C77C8;
      ML3SetCloudIDImportItem::ML3SetCloudIDImportItem((ML3SetCloudIDImportItem *)&v21[1], 0);
      v21[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C5478;
      v42[0] = v22;
      v42[1] = v21;
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      v41[0] = v10 + 24;
      v41[1] = v10;
      atomic_fetch_add_explicit((atomic_ullong *volatile)v10 + 1, 1uLL, memory_order_relaxed);
      char v23 = ML3ImportSession::updateAlbum((uint64_t)a3, v42, v41, v16[1], 1);
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
      if (v23)
      {
        v40[0] = (uint64_t)(v10 + 24);
        v40[1] = (uint64_t)v10;
        atomic_fetch_add_explicit((atomic_ullong *volatile)v10 + 1, 1uLL, memory_order_relaxed);
        char v24 = ML3ImportSession::updateTrack((uint64_t)a3, v40, 1, 1);
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
        if (!v17)
        {
LABEL_35:
          if ((v24 & 1) == 0) {
            goto LABEL_36;
          }
          goto LABEL_30;
        }
      }
      else
      {
LABEL_33:
        char v24 = 0;
        if (!v17) {
          goto LABEL_35;
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      goto LABEL_35;
    }
    v25 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      (*(void (**)(void **__return_ptr, char *))(*(void *)v11 + 88))(&__p, v11);
      p_p = &__p;
      if (v38 < 0) {
        p_p = __p;
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = p_p;
      _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_DEBUG, "[ML3SetCloudIDImportOperation] Skipping invalid track: %s", (uint8_t *)&buf, 0xCu);
      if (v38 < 0) {
        operator delete(__p);
      }
    }
LABEL_40:

    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
    if (v15 == 1) {
      break;
    }
LABEL_41:
    if (v5 == ++v8)
    {
      uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      uint64_t v5 = v30;
      if (!v30)
      {

        if ((v7 & 1) == 0) {
          goto LABEL_46;
        }
        return 1;
      }
      goto LABEL_4;
    }
  }

  if (v7) {
    return 1;
  }
LABEL_46:
  v4 = (NSArray *)os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
  {
    LOWORD(__p) = 0;
    _os_log_impl(&dword_1B022D000, &v4->super, OS_LOG_TYPE_ERROR, "[ML3SetCloudIDImportOperation] Failed to import tracks", (uint8_t *)&__p, 2u);
  }
  BOOL v31 = 0;
LABEL_54:

  return v31;
}

- (BOOL)_performImportWithTransaction:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  char v38 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(ML3ImportOperation *)self import];
  uint64_t v5 = [v4 trackData];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  id v7 = [NSString alloc];
  uint64_t v8 = [(ML3ImportOperation *)self import];
  char v9 = [v8 trackData];
  uint64_t v10 = (void *)[v7 initWithData:v9 encoding:4];

  if (!v10)
  {
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_8;
  }
  v11 = [v38 attributesOfItemAtPath:v10 error:0];
  uint64_t v12 = [v11 fileSize];

  BOOL v13 = v12 != 0;
  v14 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v41 = v12;
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v10;
    _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of track data from: %@", buf, 0x16u);
  }

LABEL_8:
  int v15 = [(ML3ImportOperation *)self import];
  int v16 = [v15 playlistData];
  BOOL v17 = [v16 length] == 0;

  if (v17) {
    goto LABEL_13;
  }
  id v18 = [NSString alloc];
  v19 = [(ML3ImportOperation *)self import];
  int v20 = [v19 playlistData];
  uint64_t v21 = [v18 initWithData:v20 encoding:4];

  if (!v21)
  {
LABEL_13:
    v26 = 0;
    BOOL v24 = 0;
  }
  else
  {
    uint64_t v22 = [v38 attributesOfItemAtPath:v21 error:0];
    uint64_t v23 = [v22 fileSize];

    BOOL v24 = v23 != 0;
    v25 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218242;
      uint64_t v41 = v23;
      __int16 v42 = 2112;
      uint64_t v43 = v21;
      _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of playlist data from: %@", buf, 0x16u);
    }

    v26 = (void *)v21;
  }
  if (v13 || v24)
  {
    if (v13)
    {
      v27 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v10 options:1 error:0];
      if (v27)
      {
        id v39 = 0;
        v28 = [MEMORY[0x1E4F28F98] propertyListWithData:v27 options:0 format:0 error:&v39];
        id v29 = v39;
        if (v29)
        {
          uint64_t v30 = v29;
          BOOL v31 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v41 = (uint64_t)v30;
            _os_log_impl(&dword_1B022D000, v31, OS_LOG_TYPE_DEBUG, "[ML3SetCloudIDImportOperation] Failed to deserialize track plist with error: %{public}@", buf, 0xCu);
          }

          BOOL v32 = 0;
          goto LABEL_32;
        }
      }
      else
      {
        v28 = 0;
      }
    }
    else
    {
      v28 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v33 = [v28 objectForKey:@"tracks"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&self->_trackInfo, v33);
      }
    }
    [(ML3ImportOperation *)self import];
    BOOL v34 = [(id)objc_claimAutoreleasedReturnValue() library];
    unint64_t v35 = [v37 connection];
    ML3ImportSession::ML3ImportSession((ML3ImportSession *)buf, v34, v35, 0, 1);
  }
  v28 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B022D000, v28, OS_LOG_TYPE_DEBUG, "[ML3SetCloudIDImportOperation] No track data or playlist data to import, finishing import operation...", buf, 2u);
  }
  BOOL v32 = 1;
LABEL_32:

  return v32;
}

- (void)main
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  if (*((unsigned char *)v12 + 24) && ([(ML3SetCloudIDImportOperation *)self isCancelled] & 1) == 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__ML3SetCloudIDImportOperation_main__block_invoke;
    v10[3] = &unk_1E5FB81E0;
    v10[4] = self;
    v10[5] = &v11;
    [(ML3ImportOperation *)self _writerTransactionWithBlock:v10];
  }
  uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(ML3SetCloudIDImportOperation *)self isCancelled];
    int v7 = *((unsigned __int8 *)v12 + 24);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)long long buf = 67109632;
    int v16 = v6;
    __int16 v17 = 1024;
    int v18 = v7;
    __int16 v19 = 2048;
    double v20 = v8 - v4;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEBUG, "[ML3SetCloudIDImportOperation] [ML3SetCloudIDImportOperation] import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((unsigned char *)v12 + 24)) {
    uint64_t v9 = [(ML3SetCloudIDImportOperation *)self isCancelled] ^ 1;
  }
  else {
    uint64_t v9 = 0;
  }
  [(ML3ImportOperation *)self setSuccess:v9];
  _Block_object_dispose(&v11, 8);
}

BOOL __36__ML3SetCloudIDImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "[ML3SetCloudIDImportOperation] failed to start store import transaction. error=%{public}@", (uint8_t *)&v10, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    [*(id *)(a1 + 32) setError:v6];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _performImportWithTransaction:v5];
  }
  BOOL v8 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;

  return v8;
}

- (unint64_t)importSource
{
  return 9;
}

@end
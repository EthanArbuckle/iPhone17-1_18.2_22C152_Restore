@interface ML3StoreImportOperation
- (BOOL)_importAlbumArtistsUsingImportSession:(void *)a3;
- (BOOL)_importPlaylistsUsingImportSession:(void *)a3;
- (BOOL)_importTracksUsingImportSession:(void *)a3;
- (BOOL)_performImportWithTransaction:(id)a3;
- (unint64_t)importSource;
- (void)main;
@end

@implementation ML3StoreImportOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumArtistData, 0);
  objc_storeStrong((id *)&self->_playlistData, 0);

  objc_storeStrong((id *)&self->_trackData, 0);
}

- (BOOL)_importAlbumArtistsUsingImportSession:(void *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (![(ML3StoreItemAlbumArtistData *)self->_albumArtistData albumArtistCount])
  {
    v16 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] no album artists in store payload. skipping import.", buf, 2u);
    }
    BOOL v15 = 1;
    goto LABEL_23;
  }
  v24 = [(ML3StoreItemAlbumArtistData *)self->_albumArtistData parsedStoreAlbumArtistImportProperties];
  v27 = [MEMORY[0x1E4F1CA48] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obj = v24;
  uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (!v4)
  {
    BOOL v15 = 1;
    goto LABEL_22;
  }
  uint64_t v5 = *(void *)v31;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v31 != v5) {
        objc_enumerationMutation(obj);
      }
      v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      v8 = [(ML3ImportOperation *)self import];
      v9 = [v8 library];
      v10 = (std::__shared_weak_count *)operator new(0x78uLL);
      v10->__shared_owners_ = 0;
      v10->__shared_weak_owners_ = 0;
      v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C7758;
      id v11 = v7;
      id v12 = v9;
      v10[2].std::__shared_count = 0u;
      LOWORD(v10[1].__shared_weak_owners_) = 256;
      BYTE2(v10[1].__shared_weak_owners_) = 1;
      *(_OWORD *)&v10[2].__shared_weak_owners_ = 0u;
      LODWORD(v10[3].__shared_owners_) = 1065353216;
      v10[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C4610;
      v10[1].__shared_owners_ = 0;
      v10[3].__shared_weak_owners_ = [v11 copy];
      LODWORD(v10[4].__vftable) = 6;
      v10[4].__shared_owners_ = 7;
      id v13 = v12;
      v10[4].__shared_weak_owners_ = (uint64_t)v13;
      BYTE1(v10[1].__shared_weak_owners_) = 0;

      v29[0] = (uint64_t)&v10[1];
      v29[1] = (uint64_t)v10;
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      v28[0] = 0;
      v28[1] = 0;
      LODWORD(v13) = ML3ImportSession::addAlbumArtist((uint64_t)a3, v29, v28);
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      if (!v13)
      {
        v17 = os_log_create("com.apple.amp.medialibrary", "Import_Oversize");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v35 = v11;
          v18 = "error importing album artist with payload=%{public}@";
          v19 = v17;
          os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
          uint32_t v21 = 12;
LABEL_20:
          _os_log_impl(&dword_1B022D000, v19, v20, v18, buf, v21);
        }
LABEL_21:

        std::__shared_weak_count::__release_shared[abi:ne180100](v10);
        BOOL v15 = 0;
        goto LABEL_22;
      }
      v14 = [NSNumber numberWithLongLong:v10[1].__shared_owners_];
      [v27 addObject:v14];

      if ([(ML3StoreImportOperation *)self isCancelled])
      {
        v17 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v18 = "[ML3StoreImportOperation] store import operation cancelled";
          v19 = v17;
          os_log_type_t v20 = OS_LOG_TYPE_ERROR;
          uint32_t v21 = 2;
          goto LABEL_20;
        }
        goto LABEL_21;
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    BOOL v15 = 1;
    if (v4) {
      continue;
    }
    break;
  }
LABEL_22:

  v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v27 requiringSecureCoding:1 error:0];
  [(ML3ImportOperation *)self setReturnData:v22];

  v16 = obj;
LABEL_23:

  return v15;
}

- (BOOL)_importPlaylistsUsingImportSession:(void *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(ML3StoreItemPlaylistData *)self->_playlistData playlistCount];
  v6 = os_log_create("com.apple.amp.medialibrary", "Import");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v32 = v5;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEBUG, "[ML3StoreImportOperation] found %lu playlists to import", buf, 0xCu);
    }

    v8 = [(ML3ImportOperation *)self import];
    v25 = [v8 library];

    [(ML3StoreItemPlaylistData *)self->_playlistData parsedStorePlaylistsImportProperties];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    BOOL v10 = v9 != 0;
    if (v9)
    {
      uint64_t v11 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(NSDictionary **)(*((void *)&v27 + 1) + 8 * i);
          int v14 = *((_DWORD *)a3 + 8);
          BOOL v15 = (std::__shared_weak_count *)operator new(0x68uLL);
          v15->__shared_owners_ = 0;
          v15->__shared_weak_owners_ = 0;
          v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C7790;
          ML3StoreImportItem::ML3StoreImportItem((ML3StoreImportItem *)&v15[1], v13, v14);
          v15[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C4E08;
          v16 = [(ML3ImportOperation *)self import];
          BYTE2(v15[1].__shared_weak_owners_) = [v16 playlistsAreLibraryOwnedContent];

          v26[0] = (uint64_t)&v15[1];
          v26[1] = (uint64_t)v15;
          atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
          char v17 = ML3ImportSession::addContainer((uint64_t)a3, v26);
          std::__shared_weak_count::__release_shared[abi:ne180100](v15);
          if ((v17 & 1) == 0)
          {
            v22 = os_log_create("com.apple.amp.medialibrary", "Import");
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B022D000, v22, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] failed to add container to import session.", buf, 2u);
            }

            std::__shared_weak_count::__release_shared[abi:ne180100](v15);
            BOOL v10 = 0;
            goto LABEL_22;
          }
          v18 = [(NSDictionary *)v13 objectForKey:&unk_1F0911E00];
          if ([v18 length])
          {
            unint64_t shared_owners = v15[1].__shared_owners_;
            os_log_type_t v20 = *((id *)a3 + 2);
            uint32_t v21 = os_log_create("com.apple.amp.medialibrary", "Import");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218242;
              unint64_t v32 = shared_owners;
              __int16 v33 = 2112;
              v34 = v18;
              _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_DEBUG, "[ML3StoreImportOperation] importing artwork for container %lld using token %@", buf, 0x16u);
            }

            [v25 importArtworkTokenForEntityPersistentID:shared_owners entityType:1 artworkToken:v18 artworkType:5 sourceType:600 usingConnection:v20];
            [v25 updateBestArtworkTokenForEntityPersistentID:shared_owners entityType:1 artworkType:5 retrievalTime:v20 usingConnection:0.0];
          }
          else
          {
            os_log_type_t v20 = os_log_create("com.apple.amp.medialibrary", "Import");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] no playlist artwork provided in playlist data.", buf, 2u);
            }
          }

          std::__shared_weak_count::__release_shared[abi:ne180100](v15);
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      BOOL v10 = 1;
    }
LABEL_22:

    v7 = v25;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] no playlists in store payload. skipping playlist import.", buf, 2u);
    }
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)_importTracksUsingImportSession:(void *)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(ML3StoreItemTrackData *)self->_trackData trackCount];
  uint64_t v4 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (!v3)
  {
    v42 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v42, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] no tracks in store payload. skipping track import.", buf, 2u);
    }
    BOOL v41 = 1;
    goto LABEL_68;
  }
  unint64_t v5 = v4;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v73 = v3;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEBUG, "[ML3StoreImportOperation] found %lu tracks to import", buf, 0xCu);
  }

  v46 = [(ML3StoreItemTrackData *)self->_trackData parsedStoreItemsImportProperties];
  int v57 = *((_DWORD *)a3 + 8);
  v48 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v46;
  uint64_t v6 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (!v6)
  {

    goto LABEL_64;
  }
  LOBYTE(v7) = 0;
  uint64_t v56 = *(void *)v68;
  do
  {
    uint64_t v8 = 0;
    uint64_t v55 = v6;
    do
    {
      if (*(void *)v68 != v56) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(NSDictionary **)(*((void *)&v67 + 1) + 8 * v8);
      BOOL v10 = (void *)MEMORY[0x1B3E93C70]();
      uint64_t v11 = (std::__shared_weak_count *)operator new(0x68uLL);
      v11->__shared_owners_ = 0;
      v11->__shared_weak_owners_ = 0;
      v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C7640;
      ML3StoreImportItem::ML3StoreImportItem((ML3StoreImportItem *)&v11[1], v9, v57);
      int v12 = ((uint64_t (*)(void))v11[1].__on_zero_shared)();
      id v13 = [(ML3ImportOperation *)self import];
      BYTE2(v11[1].__shared_weak_owners_) = [v13 tracksAreLibraryOwnedContent];

      int v14 = [(ML3ImportOperation *)self import];
      BYTE4(v11[4].__vftable) = [v14 isPendingMatch];

      if (!v12)
      {
        uint32_t v21 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          unint64_t v73 = (unint64_t)v9;
          _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] Skipping invalid track with properties=%{public}@", buf, 0xCu);
        }
LABEL_16:

LABEL_17:
        int v22 = 0;
        goto LABEL_46;
      }
      if (!_os_feature_enabled_impl())
      {
        v59[0] = (uint64_t)&v11[1];
        v59[1] = (uint64_t)v11;
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
        int v7 = ML3ImportSession::addTrack((uint64_t)a3, v59, 0);
        std::__shared_weak_count::__release_shared[abi:ne180100](v11);
        if (v7 && ([(ML3StoreImportOperation *)self isCancelled] & 1) == 0)
        {
          uint32_t v21 = [NSNumber numberWithLongLong:v11[1].__shared_owners_];
          [v48 addObject:v21];
          LOBYTE(v7) = 1;
          goto LABEL_16;
        }
        int v23 = [(ML3StoreImportOperation *)self isCancelled];
        v24 = os_log_create("com.apple.amp.medialibrary", "Import");
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        if (v23)
        {
          if (v25)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] store import operation cancelled", buf, 2u);
          }

          LOBYTE(v7) = 0;
        }
        else
        {
          if (v25)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] failed to import track data", buf, 2u);
          }
        }
        int v22 = 4;
        goto LABEL_46;
      }
      v51 = [[ML3StoreItemAlbumArtistData alloc] initWithTrackItemImportProperties:v9];
      v52 = [(ML3StoreItemAlbumArtistData *)v51 parsedStoreAlbumArtistImportProperties];
      BOOL v15 = [v52 objectAtIndexedSubscript:0];
      v16 = [(ML3ImportOperation *)self import];
      char v17 = [v16 library];
      v18 = (std::__shared_weak_count *)operator new(0x78uLL);
      v18->__shared_owners_ = 0;
      v18->__shared_weak_owners_ = 0;
      v18->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C7758;
      ML3StoreArtistImportItem::ML3StoreArtistImportItem((uint64_t)&v18[1], v15, v57, 7, v17);

      v66[0] = (uint64_t)&v18[1];
      v66[1] = (uint64_t)v18;
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
      v65[0] = v11 + 1;
      v65[1] = v11;
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      int v19 = ML3ImportSession::addAlbumArtist((uint64_t)a3, v66, v65);
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
      if ([(ML3StoreImportOperation *)self isCancelled])
      {
        os_log_type_t v20 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
      }
      else
      {
        if (v19)
        {
          v47 = [[ML3StoreItemArtistData alloc] initWithTrackImportItem:v9];
          v49 = [(ML3StoreItemArtistData *)v47 parsedStoreArtistItemImportProperties];
          v26 = [(ML3ImportOperation *)self import];
          long long v27 = [v26 library];
          long long v28 = (std::__shared_weak_count *)operator new(0x78uLL);
          v28->__shared_owners_ = 0;
          v28->__shared_weak_owners_ = 0;
          v28->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C7758;
          ML3StoreArtistImportItem::ML3StoreArtistImportItem((uint64_t)&v28[1], v49, v57, 2, v27);

          v64[0] = v28 + 1;
          v64[1] = v28;
          atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
          v63[0] = v11 + 1;
          v63[1] = v11;
          atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
          BOOL v29 = ML3ImportSession::addItemArtist((uint64_t)a3, v64, v63);
          std::__shared_weak_count::__release_shared[abi:ne180100](v11);
          std::__shared_weak_count::__release_shared[abi:ne180100](v28);
          std::__shared_weak_count::__release_shared[abi:ne180100](v28);
        }
        else
        {
          BOOL v29 = 0;
        }
        if ([(ML3StoreImportOperation *)self isCancelled])
        {
          os_log_type_t v20 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            goto LABEL_40;
          }
        }
        else
        {
          if (v29)
          {
            v44 = [[ML3StoreItemAlbumData alloc] initWithTrackImportItem:v9];
            long long v30 = [(ML3StoreItemAlbumData *)v44 parsedStoreAlbumImportProperties];
            v45 = [(ML3ImportOperation *)self import];
            v50 = [v45 library];
            long long v31 = (std::__shared_weak_count *)operator new(0x68uLL);
            v31->__shared_owners_ = 0;
            v31->__shared_weak_owners_ = 0;
            v31->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C76E8;
            id v32 = v30;
            __int16 v33 = v50;
            v31[2].std::__shared_count = 0u;
            LOWORD(v31[1].__shared_weak_owners_) = 256;
            BYTE2(v31[1].__shared_weak_owners_) = 1;
            *(_OWORD *)&v31[2].__shared_weak_owners_ = 0u;
            LODWORD(v31[3].__shared_owners_) = 1065353216;
            v31[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C4350;
            v31[1].__shared_owners_ = 0;
            v31[3].__shared_weak_owners_ = [v32 copy];
            v31[4].__vftable = v33;

            v62[0] = (uint64_t)&v31[1];
            v62[1] = (uint64_t)v31;
            atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
            v61[0] = v11 + 1;
            v61[1] = v11;
            atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
            int v34 = ML3ImportSession::addAlbum((uint64_t)a3, v62, v61, v18[1].__shared_owners_);
            std::__shared_weak_count::__release_shared[abi:ne180100](v11);
            std::__shared_weak_count::__release_shared[abi:ne180100](v31);
            std::__shared_weak_count::__release_shared[abi:ne180100](v31);
          }
          else
          {
            int v34 = 0;
          }
          if (![(ML3StoreImportOperation *)self isCancelled])
          {
            if (v34)
            {
              v60[0] = (uint64_t)&v11[1];
              v60[1] = (uint64_t)v11;
              atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
              int v39 = ML3ImportSession::addTrack((uint64_t)a3, v60, 1);
              std::__shared_weak_count::__release_shared[abi:ne180100](v11);
              if ([(ML3StoreImportOperation *)self isCancelled])
              {
                os_log_type_t v20 = os_log_create("com.apple.amp.medialibrary", "Import");
                if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_42;
                }
LABEL_40:
                *(_WORD *)buf = 0;
                id v35 = v20;
                uint64_t v36 = "[ML3StoreImportOperation] store import operation cancelled";
                uint32_t v37 = 2;
LABEL_41:
                _os_log_impl(&dword_1B022D000, v35, OS_LOG_TYPE_ERROR, v36, buf, v37);
                goto LABEL_42;
              }
              if (v39)
              {
                os_log_type_t v20 = [NSNumber numberWithLongLong:v11[1].__shared_owners_];
                [v48 addObject:v20];
                int v22 = 0;
                char v38 = 1;
                goto LABEL_43;
              }
            }
            os_log_type_t v20 = os_log_create("com.apple.amp.medialibrary", "Import");
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              goto LABEL_42;
            }
            *(_DWORD *)buf = 138543362;
            unint64_t v73 = (unint64_t)v9;
            id v35 = v20;
            uint64_t v36 = "[ML3StoreImportOperation] failed to import track data with properties=%{public}@";
            uint32_t v37 = 12;
            goto LABEL_41;
          }
          os_log_type_t v20 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            goto LABEL_40;
          }
        }
      }
LABEL_42:
      char v38 = 0;
      int v22 = 4;
LABEL_43:

      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
      if (v38)
      {
        LOBYTE(v7) = 1;
        goto LABEL_17;
      }
      LOBYTE(v7) = 0;
LABEL_46:
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      if (v22) {
        goto LABEL_58;
      }
      ++v8;
    }
    while (v55 != v8);
    uint64_t v6 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
  }
  while (v6);
LABEL_58:

  if (v7)
  {
    v40 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v48 requiringSecureCoding:1 error:0];
    [(ML3ImportOperation *)self setReturnData:v40];
    BOOL v41 = 1;
    goto LABEL_67;
  }
LABEL_64:
  v40 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v40, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] failed to import tracks", buf, 2u);
  }
  BOOL v41 = 0;
LABEL_67:

  v42 = obj;
LABEL_68:

  return v41;
}

- (BOOL)_performImportWithTransaction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [ML3StoreItemTrackData alloc];
  uint64_t v6 = [(ML3ImportOperation *)self import];
  int v7 = [v6 trackData];
  uint64_t v8 = [(ML3StoreItemTrackData *)v5 initWithTrackData:v7];
  trackData = self->_trackData;
  self->_trackData = v8;

  BOOL v10 = [ML3StoreItemPlaylistData alloc];
  uint64_t v11 = [(ML3ImportOperation *)self import];
  int v12 = [v11 playlistData];
  id v13 = [(ML3StoreItemPlaylistData *)v10 initWithPlaylistsData:v12];
  playlistData = self->_playlistData;
  self->_playlistData = v13;

  BOOL v15 = [ML3StoreItemAlbumArtistData alloc];
  v16 = [(ML3ImportOperation *)self import];
  char v17 = [v16 albumArtistData];
  v18 = [(ML3StoreItemAlbumArtistData *)v15 initWithAlbumArtistData:v17];
  albumArtistData = self->_albumArtistData;
  self->_albumArtistData = v18;

  os_log_type_t v20 = [(ML3ImportOperation *)self import];
  if ([v20 tracksAreLibraryOwnedContent])
  {
    uint32_t v21 = [(ML3ImportOperation *)self import];
    int v22 = [v21 isPendingMatch];

    if (v22) {
      int v23 = 6;
    }
    else {
      int v23 = 5;
    }
  }
  else
  {

    int v23 = 6;
  }
  [(ML3ImportOperation *)self import];
  v24 = [(id)objc_claimAutoreleasedReturnValue() library];
  BOOL v25 = [v4 connection];
  ML3ImportSession::ML3ImportSession((ML3ImportSession *)v27, v24, v25, v23, 1);
}

- (void)main
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  if (*((unsigned char *)v12 + 24) && ([(ML3StoreImportOperation *)self isCancelled] & 1) == 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __31__ML3StoreImportOperation_main__block_invoke;
    v10[3] = &unk_1E5FB81E0;
    v10[4] = self;
    v10[5] = &v11;
    [(ML3ImportOperation *)self _writerTransactionWithBlock:v10];
  }
  unint64_t v5 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(ML3StoreImportOperation *)self isCancelled];
    int v7 = *((unsigned __int8 *)v12 + 24);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 67109632;
    int v16 = v6;
    __int16 v17 = 1024;
    int v18 = v7;
    __int16 v19 = 2048;
    double v20 = v8 - v4;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEBUG, "[ML3StoreImportOperation] [ML3StoreImportOperation] import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((unsigned char *)v12 + 24)) {
    uint64_t v9 = [(ML3StoreImportOperation *)self isCancelled] ^ 1;
  }
  else {
    uint64_t v9 = 0;
  }
  [(ML3ImportOperation *)self setSuccess:v9];
  _Block_object_dispose(&v11, 8);
}

BOOL __31__ML3StoreImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
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
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] failed to start store import transaction. error=%{public}@", (uint8_t *)&v10, 0xCu);
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
  return 6;
}

@end
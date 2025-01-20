@interface MKPhotoLibraryAlbumMigrator
- (BOOL)importAndWait;
- (MKPhotoLibraryAlbumMigrator)init;
- (MKPhotoLibraryAlbumMigrator)initWithReuseDatabase:(BOOL)a3;
- (void)setCollections;
- (void)setIdentifier:(id)a3 forAsset:(id)a4;
@end

@implementation MKPhotoLibraryAlbumMigrator

- (MKPhotoLibraryAlbumMigrator)init
{
  return [(MKPhotoLibraryAlbumMigrator *)self initWithReuseDatabase:0];
}

- (MKPhotoLibraryAlbumMigrator)initWithReuseDatabase:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKPhotoLibraryAlbumMigrator;
  v4 = [(MKMigrator *)&v8 init];
  if (v4)
  {
    v5 = [[MKPhotoLibraryAssetDatabase alloc] initWithType:2 reuse:v3];
    db = v4->_db;
    v4->_db = v5;

    [(MKMigrator *)v4 setType:13];
  }
  return v4;
}

- (void)setIdentifier:(id)a3 forAsset:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  [(MKPhotoLibraryAssetDatabase *)v7->_db setIdentifier:v8 forAsset:v6];
  objc_sync_exit(v7);
}

- (BOOL)importAndWait
{
  return 1;
}

- (void)setCollections
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v28 = [[MKPhotoLibrary alloc] initWithContentType:0];
  uint64_t v3 = 80;
  [(MKPhotoLibraryAssetDatabase *)self->_db collections];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    uint64_t v25 = *(void *)v31;
    do
    {
      uint64_t v7 = 0;
      uint64_t v26 = v5;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v30 + 1) + 8 * v7);
        id v29 = 0;
        unint64_t v9 = -[MKPhotoLibrary countForCollection:error:](v28, "countForCollection:error:", v8, &v29, v25);
        id v10 = v29;
        v11 = v10;
        if (v9 >> 3 < 0x271)
        {
          if (v10)
          {
            [(MKMigrator *)self migratorDidFailWithImportError:v10];
            [*(id *)((char *)&self->super.super.isa + v3) removeCollection:v8];
          }
          else
          {
            unint64_t v14 = [*(id *)((char *)&self->super.super.isa + v3) countForCollection:v8];
            if (v14 >= 5000 - v9) {
              unint64_t v15 = 5000 - v9;
            }
            else {
              unint64_t v15 = v14;
            }
            if (v15 >= 0x64) {
              uint64_t v16 = 100;
            }
            else {
              uint64_t v16 = v15;
            }
            if (v14 <= 5000 - v9)
            {
              if (v15)
              {
                uint64_t v18 = 0;
                do
                {
                  v19 = (void *)MEMORY[0x230F5C060]();
                  uint64_t v20 = v3;
                  v21 = [*(id *)((char *)&self->super.super.isa + v3) identifiersForCollection:v8 offset:v18 limit:v16];
                  v22 = +[MKLog log];
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412802;
                    uint64_t v35 = v8;
                    __int16 v36 = 2048;
                    uint64_t v37 = v18;
                    __int16 v38 = 2048;
                    unint64_t v39 = v16;
                    _os_log_impl(&dword_22BFAC000, v22, OS_LOG_TYPE_INFO, "will set collections. collection=%@, offset=%ld, limit=%ld", buf, 0x20u);
                  }

                  [(MKMigrator *)self migratorWillMeasureImport];
                  [(MKPhotoLibrary *)v28 setCollection:v8 forLocalIdentifiers:v21];
                  [(MKMigrator *)self migratorDidMeasureImport];
                  v23 = +[MKLog log];
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412802;
                    uint64_t v35 = v8;
                    __int16 v36 = 2048;
                    uint64_t v37 = v18;
                    __int16 v38 = 2048;
                    unint64_t v39 = v16;
                    _os_log_impl(&dword_22BFAC000, v23, OS_LOG_TYPE_INFO, "did set collections. collection=%@, offset=%ld, limit=%ld", buf, 0x20u);
                  }

                  v18 += v16;
                  v15 -= v16;
                  if (v15 >= 0x64) {
                    uint64_t v16 = 100;
                  }
                  else {
                    uint64_t v16 = v15;
                  }

                  uint64_t v3 = v20;
                }
                while (v15);
              }
              [(MKMigrator *)self migratorDidImport];
              [*(id *)((char *)&self->super.super.isa + v3) removeCollection:v8];
              uint64_t v6 = v25;
              v11 = 0;
            }
            else
            {
              v17 = [MEMORY[0x263F087E8] errorWithDomain:@"MKPhotoLibraryAlbumError" code:1 userInfo:0];
              [(MKMigrator *)self migratorDidFailWithImportError:v17];
              [*(id *)((char *)&self->super.super.isa + v3) removeCollection:v8];
            }
            uint64_t v5 = v26;
          }
        }
        else
        {
          v12 = +[MKLog log];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v35 = v8;
            __int16 v36 = 2048;
            uint64_t v37 = 5000;
            __int16 v38 = 2048;
            unint64_t v39 = v9;
            _os_log_impl(&dword_22BFAC000, v12, OS_LOG_TYPE_INFO, "will skip a collection. collection=%@, capacity=%ld, assets=%ld", buf, 0x20u);
          }

          v13 = [MEMORY[0x263F087E8] errorWithDomain:@"MKPhotoLibraryAlbumError" code:1 userInfo:0];
          [(MKMigrator *)self migratorDidFailWithImportError:v13];
          [*(id *)((char *)&self->super.super.isa + v3) removeCollection:v8];
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v5);
  }

  v24 = *(Class *)((char *)&self->super.super.isa + v3);
  *(Class *)((char *)&self->super.super.isa + v3) = 0;
}

- (void).cxx_destruct
{
}

@end
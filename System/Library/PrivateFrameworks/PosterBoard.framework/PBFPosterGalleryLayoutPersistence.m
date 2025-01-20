@interface PBFPosterGalleryLayoutPersistence
- (BOOL)saveGalleryLayout:(id)a3 returningPersistenceDate:(id *)a4 error:(id *)a5;
- (NSURL)url;
- (PBFPosterGalleryLayoutPersistence)initWithURL:(id)a3;
- (id)loadNewestUsableGalleryLayoutReturningError:(id *)a3;
- (id)loadNewestUsableGalleryLayoutReturningPersistenceDate:(id *)a3 purgeableGalleryLayoutURLs:(id *)a4 error:(id *)a5;
@end

@implementation PBFPosterGalleryLayoutPersistence

- (PBFPosterGalleryLayoutPersistence)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBFPosterGalleryLayoutPersistence;
  v5 = [(PBFPosterGalleryLayoutPersistence *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;
  }
  return v5;
}

- (id)loadNewestUsableGalleryLayoutReturningError:(id *)a3
{
  return [(PBFPosterGalleryLayoutPersistence *)self loadNewestUsableGalleryLayoutReturningPersistenceDate:0 purgeableGalleryLayoutURLs:0 error:a3];
}

- (id)loadNewestUsableGalleryLayoutReturningPersistenceDate:(id *)a3 purgeableGalleryLayoutURLs:(id *)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  objc_super v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  url = self->_url;
  id v50 = 0;
  v11 = [v9 contentsOfDirectoryAtURL:url includingPropertiesForKeys:0 options:5 error:&v50];
  id v12 = v50;

  if (v12)
  {
    a3 = 0;
    if (a5) {
      *a5 = v12;
    }
    goto LABEL_39;
  }
  v41 = a4;
  [v11 sortedArrayUsingComparator:&__block_literal_global_19];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
  id v42 = v13;
  if (!v14)
  {

    if (a3)
    {
      v40 = a3;
      id v16 = 0;
      a3 = 0;
      id v27 = 0;
      v28 = 0;
      goto LABEL_26;
    }
    id v16 = 0;
    id v27 = 0;
LABEL_33:
    if (v41) {
      goto LABEL_34;
    }
    goto LABEL_36;
  }
  uint64_t v15 = v14;
  v39 = v11;
  v40 = a3;
  v38 = a5;
  id v16 = 0;
  uint64_t v17 = *(void *)v47;
LABEL_6:
  uint64_t v18 = 0;
  while (1)
  {
    if (*(void *)v47 != v17) {
      objc_enumerationMutation(v13);
    }
    v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);

    id v45 = 0;
    v20 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v19 options:1 error:&v45];
    id v16 = v45;
    if (!v20) {
      goto LABEL_13;
    }
    v21 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v22 = objc_opt_class();
    id v44 = v16;
    a3 = [v21 unarchivedObjectOfClass:v22 fromData:v20 error:&v44];
    id v23 = v44;

    if (a3) {
      goto LABEL_21;
    }
    v24 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v25 = objc_opt_class();
    id v43 = v23;
    v26 = [v24 unarchivedObjectOfClass:v25 fromData:v20 error:&v43];
    id v16 = v43;

    a3 = [v26 posterBoardRepresentation];

    if (a3) {
      break;
    }

    id v13 = v42;
LABEL_13:
    if (v15 == ++v18)
    {
      uint64_t v15 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v15) {
        goto LABEL_6;
      }

      if (v40)
      {
        a3 = 0;
        id v27 = 0;
        v28 = 0;
        a5 = v38;
        v11 = v39;
        goto LABEL_26;
      }
      a3 = 0;
      id v27 = 0;
      a5 = v38;
      v11 = v39;
      goto LABEL_33;
    }
  }
  id v23 = v16;
  id v13 = v42;
LABEL_21:
  id v27 = v19;

  a5 = v38;
  v11 = v39;
  if (!v40) {
    goto LABEL_27;
  }
  if (v27)
  {
    v29 = [v27 lastPathComponent];
    v30 = [v29 stringByDeletingPathExtension];
    [v30 doubleValue];
    double v32 = v31;

    id v13 = v42;
    v28 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v32];
  }
  else
  {
    v28 = 0;
  }
  id v16 = v23;
LABEL_26:
  id v33 = v28;
  id *v40 = v33;

  id v23 = v16;
LABEL_27:
  if (v41)
  {
    if (v27)
    {
      v34 = (void *)[v13 mutableCopy];
      [v34 removeObject:v27];
      id v35 = (id)[v34 copy];

      id v13 = v42;
      id v16 = v23;
      goto LABEL_35;
    }
    id v16 = v23;
LABEL_34:
    id v35 = v13;
    id v27 = 0;
LABEL_35:
    id v36 = v35;
    id *v41 = v36;
  }
  else
  {
    id v16 = v23;
  }
LABEL_36:
  if (a5) {
    *a5 = v16;
  }

LABEL_39:
  return a3;
}

uint64_t __124__PBFPosterGalleryLayoutPersistence_loadNewestUsableGalleryLayoutReturningPersistenceDate_purgeableGalleryLayoutURLs_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 lastPathComponent];
  uint64_t v6 = [v5 stringByDeletingPathExtension];

  v7 = [v4 lastPathComponent];

  v8 = [v7 stringByDeletingPathExtension];

  uint64_t v9 = [v8 compare:v6 options:64];
  return v9;
}

- (BOOL)saveGalleryLayout:(id)a3 returningPersistenceDate:(id *)a4 error:(id *)a5
{
  id v23 = 0;
  v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v23];
  id v9 = v23;
  v10 = v9;
  if (v8)
  {
    v11 = [MEMORY[0x1E4F1C9C8] date];
    url = self->_url;
    id v13 = NSString;
    [v11 timeIntervalSince1970];
    uint64_t v15 = objc_msgSend(v13, "stringWithFormat:", @"%f", v14);
    id v16 = [(NSURL *)url URLByAppendingPathComponent:v15];
    uint64_t v17 = [v16 URLByAppendingPathExtension:@"plist"];

    id v22 = 0;
    char v18 = [v8 writeToURL:v17 options:268435457 error:&v22];
    id v19 = v22;
    v20 = v19;
    if (v18)
    {
      id v19 = v11;
      a5 = a4;
      if (!a4) {
        goto LABEL_9;
      }
    }
    else if (!a5)
    {
LABEL_9:

      goto LABEL_10;
    }
    *a5 = v19;
    goto LABEL_9;
  }
  char v18 = 0;
  if (a5) {
    *a5 = v9;
  }
LABEL_10:

  return v18;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end
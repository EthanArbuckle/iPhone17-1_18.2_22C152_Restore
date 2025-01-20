@interface OCPZipPackage
- (OCPZipPackage)initWithArchive:(id)a3;
- (OCPZipPackage)initWithData:(id)a3;
- (OCPZipPackage)initWithPath:(id)a3;
- (id)partForLocation:(id)a3;
- (void)resetPartForLocation:(id)a3;
@end

@implementation OCPZipPackage

- (OCPZipPackage)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [[OISFUZipArchive alloc] initWithData:v4 collapseCommonRootDirectory:0];
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  mParts = self->mParts;
  self->mParts = v6;

  v8 = [(OCPZipPackage *)self initWithArchive:v5];
  return v8;
}

- (OCPZipPackage)initWithArchive:(id)a3
{
  id v20 = a3;
  p_mArchive = &self->mArchive;
  objc_storeStrong((id *)&self->mArchive, a3);
  v19 = [@"." stringByAppendingString:@"rels"];
  v6 = objc_msgSend(@"_rels", "stringByAppendingPathComponent:");
  v7 = [(OISFUZipArchive *)self->mArchive entryWithName:v6];
  if (!v7) {
    +[OCPException raise:@"OCPZipPackageError" format:@"No package relationships"];
  }
  v8 = (xmlDoc *)[v7 xmlDocument];
  v9 = [(OISFUZipArchive *)*p_mArchive entryWithName:@"docProps/core.xml"];
  v10 = v9;
  if (v9) {
    v11 = (xmlDoc *)[v9 xmlDocument];
  }
  else {
    v11 = 0;
  }
  v12 = [(OISFUZipArchive *)*p_mArchive entryWithName:@"docProps/app.xml"];
  v13 = v12;
  if (v12) {
    v14 = (xmlDoc *)[v12 xmlDocument];
  }
  else {
    v14 = 0;
  }
  v15 = [(OISFUZipArchive *)*p_mArchive entryWithName:@"[Content_Types].xml"];
  if (!v15) {
    +[OCPException raise:@"OCPZipPackageError" format:@"No package content types"];
  }
  v16 = (xmlDoc *)[v15 xmlDocument];

  v17 = [(OCPPackage *)self initWithRelationshipsXml:v8 corePropertiesXml:v11 appPropertiesXml:v14 contentTypesXml:v16];
  if (v8) {
    xmlFreeDoc(v8);
  }
  if (v11) {
    xmlFreeDoc(v11);
  }
  if (v14) {
    xmlFreeDoc(v14);
  }
  if (v16) {
    xmlFreeDoc(v16);
  }

  return v17;
}

- (id)partForLocation:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->mParts objectForKey:v4];
  if (!v5)
  {
    if ([v4 isInternalToPackage])
    {
      v6 = [v4 path];
      if ([v6 isAbsolutePath] && (unint64_t)objc_msgSend(v6, "length") >= 2)
      {
        v5 = [[OCPZipPackagePart alloc] initWithArchive:self->mArchive location:v4 package:self];

        if (v5)
        {
LABEL_9:
          [(NSMutableDictionary *)self->mParts setObject:v5 forKey:v4];
          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    v5 = [MEMORY[0x263EFF9D0] null];
    goto LABEL_9;
  }
LABEL_10:
  v7 = [MEMORY[0x263EFF9D0] null];

  if (v5 == v7)
  {

    v5 = 0;
  }

  return v5;
}

- (void)resetPartForLocation:(id)a3
{
  id v5 = a3;
  id v4 = -[NSMutableDictionary objectForKey:](self->mParts, "objectForKey:");
  if (v4) {
    [(NSMutableDictionary *)self->mParts removeObjectForKey:v5];
  }
}

- (OCPZipPackage)initWithPath:(id)a3
{
  id v4 = a3;
  id v5 = [[OISFUZipArchive alloc] initWithPath:v4 collapseCommonRootDirectory:0];
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  mParts = self->mParts;
  self->mParts = v6;

  v8 = [(OCPZipPackage *)self initWithArchive:v5];
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mParts, 0);
  objc_storeStrong((id *)&self->mArchive, 0);
}

@end
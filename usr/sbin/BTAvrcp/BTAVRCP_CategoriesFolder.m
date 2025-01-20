@interface BTAVRCP_CategoriesFolder
- (BTAVRCP_CategoriesFolder)initWithName:(id)a3 uid:(unint64_t)a4;
- (NSArray)activeCategories;
- (id)baseQuery;
- (id)folderNameForUid:(unint64_t)a3;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)folderTypeForUid:(unint64_t)a3;
- (unsigned)playItemWithUid:(unint64_t)a3;
- (void)dealloc;
- (void)refreshActiveCategories;
- (void)setActiveCategories:(id)a3;
@end

@implementation BTAVRCP_CategoriesFolder

- (BTAVRCP_CategoriesFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BTAVRCP_CategoriesFolder;
  v4 = [(BTAVRCP_VFSFolder *)&v9 initWithName:a3 uid:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"refreshActiveCategories" name:MPMediaLibraryDidChangeNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v4 selector:"refreshActiveCategories" name:MPRadioLibraryStationsDidChangeNotification object:0];

    v7 = +[MPMediaLibrary defaultMediaLibrary];
    [v7 beginGeneratingLibraryChangeNotifications];

    [(BTAVRCP_CategoriesFolder *)v4 refreshActiveCategories];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[MPMediaLibrary defaultMediaLibrary];
  [v3 endGeneratingLibraryChangeNotifications];

  v4.receiver = self;
  v4.super_class = (Class)BTAVRCP_CategoriesFolder;
  [(BTAVRCP_CategoriesFolder *)&v4 dealloc];
}

- (void)refreshActiveCategories
{
  id v12 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v3 = 1;
  while (2)
  {
    switch(v3)
    {
      case 1:
        objc_super v4 = +[MPMediaLibrary defaultMediaLibrary];
        unsigned int v5 = [v4 hasMedia];

        if (v5) {
          goto LABEL_11;
        }
        goto LABEL_12;
      case 2:
        v6 = +[MPMediaLibrary defaultMediaLibrary];
        unsigned __int8 v7 = [v6 hasPlaylists];
        goto LABEL_8;
      case 3:
        v6 = +[MPRadioLibrary defaultRadioLibrary];
        unsigned __int8 v7 = [v6 isEnabled];
        goto LABEL_8;
      case 4:
        v6 = +[MPMediaLibrary defaultMediaLibrary];
        unsigned __int8 v7 = [v6 hasPodcasts];
LABEL_8:
        unsigned __int8 v8 = v7;

        if ((v8 & 1) == 0) {
          goto LABEL_12;
        }
        goto LABEL_11;
      case 5:
        objc_super v9 = +[MPMediaLibrary defaultMediaLibrary];
        unsigned __int8 v10 = [v9 hasAudiobooks];

        if ((v10 & 1) == 0) {
          goto LABEL_13;
        }
LABEL_11:
        v11 = +[NSNumber numberWithUnsignedLongLong:v3];
        [v12 addObject:v11];

LABEL_12:
        if (++v3 != 6) {
          continue;
        }
LABEL_13:
        [(BTAVRCP_CategoriesFolder *)self setActiveCategories:v12];

        return;
      default:
        goto LABEL_12;
    }
  }
}

- (id)folderNameForUid:(unint64_t)a3
{
  objc_super v4 = +[NSBundle mobileBluetoothBundle];
  unsigned int v5 = v4;
  switch(a3)
  {
    case 1uLL:
      CFStringRef v6 = @"MY_MUSIC";
      CFStringRef v7 = @"My Music";
      goto LABEL_8;
    case 2uLL:
      CFStringRef v6 = @"PLAYLISTS";
      CFStringRef v7 = @"Playlists";
      goto LABEL_8;
    case 3uLL:
      CFStringRef v6 = @"RADIO";
      CFStringRef v7 = @"Radio";
      goto LABEL_8;
    case 4uLL:
      CFStringRef v6 = @"PODCASTS";
      CFStringRef v7 = @"Podcasts";
      goto LABEL_8;
    case 5uLL:
      CFStringRef v6 = @"AUDIOBOOKS";
      CFStringRef v7 = @"Audiobooks";
LABEL_8:
      unsigned __int8 v8 = [v4 localizedStringForKey:v6 value:v7 table:0];
      break;
    default:
      unsigned __int8 v8 = 0;
      break;
  }

  return v8;
}

- (unsigned)folderTypeForUid:(unint64_t)a3
{
  unint64_t v3 = 0x20205050000uLL >> (8 * a3);
  if (a3 >= 6) {
    LOBYTE(v3) = 0;
  }
  return v3 & 7;
}

- (id)baseQuery
{
  id v2 = objc_alloc_init((Class)MPMediaQuery);

  return v2;
}

- (unint64_t)childrenCount
{
  id v2 = [(BTAVRCP_CategoriesFolder *)self activeCategories];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  CFStringRef v7 = [(BTAVRCP_CategoriesFolder *)self activeCategories];
  unsigned __int8 v8 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v9 = [v7 containsObject:v8];

  if (!v9) {
    return 9;
  }
  switch(a3)
  {
    case 1uLL:
      unsigned __int8 v10 = [BTAVRCP_MyMusicFolder alloc];
      v11 = [(BTAVRCP_CategoriesFolder *)self folderNameForUid:1];
      id v12 = v10;
      v13 = v11;
      uint64_t v14 = 1;
      goto LABEL_9;
    case 2uLL:
      v16 = [BTAVRCP_PlaylistsFolder alloc];
      v11 = [(BTAVRCP_CategoriesFolder *)self folderNameForUid:2];
      id v12 = v16;
      v13 = v11;
      uint64_t v14 = 2;
      goto LABEL_9;
    case 3uLL:
      v17 = [BTAVRCP_RadioFolder alloc];
      v11 = [(BTAVRCP_CategoriesFolder *)self folderNameForUid:3];
      id v12 = v17;
      v13 = v11;
      uint64_t v14 = 3;
      goto LABEL_9;
    case 4uLL:
      v18 = [BTAVRCP_PodcastsFolder alloc];
      v11 = [(BTAVRCP_CategoriesFolder *)self folderNameForUid:4];
      id v12 = v18;
      v13 = v11;
      uint64_t v14 = 4;
      goto LABEL_9;
    case 5uLL:
      v19 = [BTAVRCP_AudiobooksFolder alloc];
      v11 = [(BTAVRCP_CategoriesFolder *)self folderNameForUid:5];
      id v12 = v19;
      v13 = v11;
      uint64_t v14 = 5;
LABEL_9:
      *a4 = [v12 initWithName:v13 uid:v14];

      break;
    default:
      return 4;
  }
  return 4;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  CFStringRef v6 = [(BTAVRCP_CategoriesFolder *)self activeCategories];
  id v7 = [v6 count];

  if ((unint64_t)v7 <= a3)
  {
    uint64_t v14 = 0;
  }
  else
  {
    unsigned __int8 v8 = [(BTAVRCP_CategoriesFolder *)self activeCategories];
    unsigned int v9 = [v8 objectAtIndexedSubscript:a3];
    id v10 = [v9 unsignedLongLongValue];

    uint64_t v11 = [(BTAVRCP_CategoriesFolder *)self folderTypeForUid:v10];
    id v12 = +[NSNumber numberWithUnsignedLongLong:v10];
    v13 = [(BTAVRCP_CategoriesFolder *)self folderNameForUid:v10];
    uint64_t v14 = [(BTAVRCP_VFSFolder *)self replyFolderWithType:v11 uid:v12 name:v13];
  }

  return v14;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  unsigned int v5 = [(BTAVRCP_CategoriesFolder *)self activeCategories];
  CFStringRef v6 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v7 = [v5 containsObject:v6];

  if (v7) {
    return &__NSDictionary0__struct;
  }
  else {
    return 0;
  }
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  objc_super v4 = [(BTAVRCP_CategoriesFolder *)self activeCategories];
  unsigned int v5 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v6 = [v4 containsObject:v5];

  if (v6) {
    return 12;
  }
  else {
    return 9;
  }
}

- (NSArray)activeCategories
{
  return self->_activeCategories;
}

- (void)setActiveCategories:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
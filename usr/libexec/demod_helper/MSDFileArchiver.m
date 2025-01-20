@interface MSDFileArchiver
- (BOOL)compressContent:(id)a3 toPath:(id)a4;
@end

@implementation MSDFileArchiver

- (BOOL)compressContent:(id)a3 toPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 path];
  id v8 = v5;
  v9 = (char *)[v8 fileSystemRepresentation];
  id v10 = v6;
  id v11 = [v10 fileSystemRepresentation];
  if (v7 && v9 && v11)
  {
    v12 = (void *)archive_write_new();
    archive_write_set_format_zip();
    if (archive_write_open_filename())
    {
      free(v12);
      v32 = sub_100027250();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10002F3A4();
      }

      BOOL v16 = 0;
      goto LABEL_36;
    }
    uint64_t disk_new = archive_read_disk_new();
    archive_read_disk_set_standard_lookup();
    v39[0] = v9;
    v39[1] = 0;
    v13 = fts_open(v39, 84, 0);
    if (v13)
    {
      id v35 = v10;
      id v14 = [v7 stringByDeletingLastPathComponent];
      strlen((const char *)[v14 fileSystemRepresentation]);

      v15 = fts_read(v13);
      BOOL v16 = 1;
      if (v15)
      {
        v17 = v15;
        while (1)
        {
          unsigned int fts_info = v17->fts_info;
          if (fts_info > 0xE) {
            goto LABEL_13;
          }
          int v19 = 1 << fts_info;
          if ((v19 & 0x4266) == 0) {
            break;
          }
LABEL_10:
          v17 = fts_read(v13);
          if (!v17)
          {
            BOOL v16 = 1;
            id v10 = v35;
            uint64_t v28 = disk_new;
            goto LABEL_29;
          }
        }
        if ((v19 & 0x490) != 0)
        {
          v22 = sub_100027250();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_10002F36C();
          }
          uint64_t v23 = 0;
LABEL_26:
          id v10 = v35;
          uint64_t v28 = disk_new;
          goto LABEL_27;
        }
LABEL_13:
        v20 = +[NSString stringWithCString:v17->fts_accpath encoding:4];
        v21 = +[NSURL fileURLWithPath:v20];
        v22 = +[NSFileHandle fileHandleForReadingFromURL:v21 error:0];

        if (v22)
        {
          uint64_t v23 = archive_entry_new();
          archive_entry_set_pathname();
          [v22 fileDescriptor];
          uint64_t v28 = disk_new;
          if (archive_read_disk_entry_from_file())
          {
            v31 = sub_100027250();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              sub_10002F33C(&v37, v38);
            }
          }
          else
          {
            if (!archive_write_header())
            {
              off_t st_size = v17->fts_statp->st_size;
              v25 = [v22 readDataOfLength:st_size];
              for (i = v25; ; v25 = i)
              {
                if (![v25 length])
                {
                  archive_entry_free();

                  goto LABEL_10;
                }
                id v27 = i;
                [v27 bytes];
                [v27 length];
                if (archive_write_data() == -1) {
                  break;
                }
                i = [v22 readDataOfLength:st_size];
              }
              v30 = sub_100027250();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                sub_10002F2DC(&v37, v38);
              }

              goto LABEL_26;
            }
            v31 = sub_100027250();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              sub_10002F30C(&v37, v38);
            }
          }
        }
        else
        {
          v31 = sub_100027250();
          uint64_t v28 = disk_new;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_10002F2AC(&v37, v38);
          }
          uint64_t v23 = 0;
        }
        id v10 = v35;

LABEL_27:
        BOOL v16 = 0;
        if (v23) {
          archive_entry_free();
        }
LABEL_29:
        if (!v12) {
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v28 = disk_new;
        if (!v12)
        {
LABEL_32:
          if (v28) {
            archive_read_free();
          }
          if (v13) {
            fts_close(v13);
          }
LABEL_36:

          return v16;
        }
      }
    }
    else
    {
      v33 = sub_100027250();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_10002F274();
      }

      BOOL v16 = 0;
      uint64_t v28 = disk_new;
      if (!v12) {
        goto LABEL_32;
      }
    }
    if (archive_write_free()) {
      BOOL v16 = 0;
    }
    goto LABEL_32;
  }
  v34 = sub_100027250();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    sub_10002F3DC();
  }

  __break(1u);
  return result;
}

@end
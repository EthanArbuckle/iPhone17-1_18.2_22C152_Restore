@interface SRSensorDescriptionEnumerator
- (id)nextObject;
- (void)dealloc;
@end

@implementation SRSensorDescriptionEnumerator

- (void)dealloc
{
  if (self) {
    objc_setProperty_atomic(self, a2, 0, 24);
  }

  v3.receiver = self;
  v3.super_class = (Class)SRSensorDescriptionEnumerator;
  [(SRSensorDescriptionEnumerator *)&v3 dealloc];
}

- (id)nextObject
{
  unint64_t currentSensorDirectoryIndex = self->_currentSensorDirectoryIndex;
  sensorsCache = self->_sensorsCache;
  if (sensorsCache) {
    sensorsCache = objc_getProperty(sensorsCache, a2, 16, 1);
  }
  if (currentSensorDirectoryIndex >= (unint64_t)[sensorsCache count])
  {
    v7 = qword_10006EB38;
    if (os_log_type_enabled((os_log_t)qword_10006EB38, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v29[0]) = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Unexpectedly trying to iterate beyond the maximum number of directories", (uint8_t *)v29, 2u);
    }
    return 0;
  }
  if (self->_descriptionFileEnumerator)
  {
    NSURLResourceKey v6 = NSURLIsDirectoryKey;
  }
  else
  {
    Property = self->_sensorsCache;
    if (Property) {
      Property = objc_getProperty(Property, v5, 16, 1);
    }
    id v9 = [Property objectAtIndexedSubscript:self->_currentSensorDirectoryIndex];
    NSURLResourceKey v6 = NSURLIsDirectoryKey;
    NSURLResourceKey v30 = NSURLIsDirectoryKey;
    v10 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") enumeratorAtURL:v9 includingPropertiesForKeys:+[NSArray arrayWithObjects:&v30 count:1] options:4 errorHandler:0];
    objc_setProperty_atomic(self, v11, v10, 24);
  }
  while (1)
  {
    id v13 = [(NSDirectoryEnumerator *)self->_descriptionFileEnumerator nextObject];
    v29[0] = 0;
    [v13 getResourceValue:v29 forKey:v6 error:0];
    unsigned __int8 v14 = [v29[0] BOOLValue];
    v12 = 0;
    if (v14) {
      goto LABEL_13;
    }
    if (!v13)
    {
      unint64_t v16 = self->_currentSensorDirectoryIndex + 1;
      self->_unint64_t currentSensorDirectoryIndex = v16;
      v17 = self->_sensorsCache;
      if (v17) {
        v17 = objc_getProperty(v17, v15, 16, 1);
      }
      if (v16 >= (unint64_t)objc_msgSend(v17, "count", v12)) {
        break;
      }
      v19 = self->_sensorsCache;
      if (v19) {
        v19 = objc_getProperty(v19, v18, 16, 1);
      }
      v20 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", [v19 objectAtIndexedSubscript:self->_currentSensorDirectoryIndex], 0, 4, 0);
      objc_setProperty_atomic(self, v21, v20, 24);
      id v13 = [(NSDirectoryEnumerator *)self->_descriptionFileEnumerator nextObject];
      if (!v13) {
        break;
      }
    }
    id v22 = [[v13 URLByDeletingPathExtension:v12] lastPathComponent];
    v23 = self->_sensorsCache;
    if (v23)
    {
      id v24 = v22;
      v25 = (NSURL *)[v22 sr_sensorByDeletingDeletionRecord];
      unsigned __int8 v26 = [(NSURL *)v25 isEqualToString:v24];
      v12 = [(NSCache *)v23->_sensorsCache objectForKey:v25];
      if (!v12)
      {
        v12 = sub_10001A638((uint64_t)v23, v25);
        if (v12) {
          char v27 = v26;
        }
        else {
          char v27 = 1;
        }
        if (v27) {
          goto LABEL_13;
        }
LABEL_30:
        v12 = +[SRSensorDescription sensorDescriptionForDeletionRecordFromDescription:v12];
        goto LABEL_13;
      }
      if ((v26 & 1) == 0) {
        goto LABEL_30;
      }
    }
    else
    {
      v12 = 0;
    }
LABEL_13:
    if (v12) {
      return v12;
    }
  }
  objc_setProperty_atomic(self, v18, 0, 24);
  return 0;
}

@end
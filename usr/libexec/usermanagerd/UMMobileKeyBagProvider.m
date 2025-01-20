@interface UMMobileKeyBagProvider
- (int)createPersonaKeyForUser:(unsigned int)a3 personaUUID:(id)a4 passcode:(id)a5 homeDir:(id)a6;
- (int)removePersonaKeyForUser:(unsigned int)a3 personaUUID:(id)a4 volumeUUID:(id)a5;
- (int)setVolumePath:(id)a3 forPersona:(id)a4;
@end

@implementation UMMobileKeyBagProvider

- (int)createPersonaKeyForUser:(unsigned int)a3 personaUUID:(id)a4 passcode:(id)a5 homeDir:(id)a6
{
  id v7 = a4;
  id v8 = a6;
  int PersonaKeyForUser = MKBUserSessionCreatePersonaKeyForUser();
  if (PersonaKeyForUser)
  {
    if (qword_1000E4210 != -1) {
      dispatch_once(&qword_1000E4210, &stru_1000D5CF8);
    }
    v10 = (id)qword_1000E4208;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v11 = sub_100055404(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
LABEL_17:
        v15 = (const char *)_os_log_send_and_compose_impl();
        v16 = (char *)v15;
        if (v15) {
          sub_100055434(v15);
        }
        goto LABEL_20;
      }
LABEL_19:
      v16 = 0;
LABEL_20:
      free(v16);
    }
  }
  else
  {
    if (qword_1000E4210 != -1) {
      dispatch_once(&qword_1000E4210, &stru_1000D5CF8);
    }
    v10 = (id)qword_1000E4208;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v13 = sub_100055404(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14) {
        goto LABEL_17;
      }
      goto LABEL_19;
    }
  }

  return PersonaKeyForUser;
}

- (int)removePersonaKeyForUser:(unsigned int)a3 personaUUID:(id)a4 volumeUUID:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = v7;
  if (v7)
  {
    CFStringRef v19 = @"MKBUserSessionVolumeUUID";
    id v20 = v7;
    v9 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  }
  else
  {
    v9 = 0;
  }
  int v10 = MKBUserSessionRemovePersonaKeyForUser();
  if (v10)
  {
    if (qword_1000E4210 != -1) {
      dispatch_once(&qword_1000E4210, &stru_1000D5CF8);
    }
    unsigned int v11 = (id)qword_1000E4208;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = sub_100055404(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
LABEL_20:
        v16 = (const char *)_os_log_send_and_compose_impl();
        v17 = (char *)v16;
        if (v16) {
          sub_100055434(v16);
        }
        goto LABEL_23;
      }
LABEL_22:
      v17 = 0;
LABEL_23:
      free(v17);
    }
  }
  else
  {
    if (qword_1000E4210 != -1) {
      dispatch_once(&qword_1000E4210, &stru_1000D5CF8);
    }
    unsigned int v11 = (id)qword_1000E4208;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v14 = sub_100055404(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15) {
        goto LABEL_20;
      }
      goto LABEL_22;
    }
  }

  return v10;
}

- (int)setVolumePath:(id)a3 forPersona:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = MKBUserSessionSetVolumeToPersona();
  if (v7)
  {
    if (qword_1000E4210 != -1) {
      dispatch_once(&qword_1000E4210, &stru_1000D5CF8);
    }
    id v8 = (id)qword_1000E4208;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = sub_100055404(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v9 & 0xFFFFFFFE;
      }
      if (v10)
      {
LABEL_17:
        unsigned int v13 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v14 = (char *)v13;
        if (v13) {
          sub_100055434(v13);
        }
        goto LABEL_20;
      }
LABEL_19:
      unsigned int v14 = 0;
LABEL_20:
      free(v14);
    }
  }
  else
  {
    if (qword_1000E4210 != -1) {
      dispatch_once(&qword_1000E4210, &stru_1000D5CF8);
    }
    id v8 = (id)qword_1000E4208;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v11 = sub_100055404(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12) {
        goto LABEL_17;
      }
      goto LABEL_19;
    }
  }

  return v7;
}

@end
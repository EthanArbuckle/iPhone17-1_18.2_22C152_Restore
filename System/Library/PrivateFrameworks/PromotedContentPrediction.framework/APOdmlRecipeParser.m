@interface APOdmlRecipeParser
- (id)_attachmentURLWithName:(id)a3 fileName:(id)a4;
- (id)formatRecipe:(id)a3 attachments:(id)a4 error:(id *)a5;
@end

@implementation APOdmlRecipeParser

- (id)formatRecipe:(id)a3 attachments:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend_count(v9, v10, v11))
  {
    v14 = objc_msgSend_modelFileName(v8, v12, v13);
    v16 = objc_msgSend__attachmentURLWithName_fileName_(self, v15, (uint64_t)v9, v14);

    if (v16)
    {
      id v17 = v16;
    }
    else
    {
      v20 = OdmlLogForCategory(0xBuLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138412546;
        id v25 = (id)objc_opt_class();
        __int16 v26 = 2112;
        uint64_t v27 = 0;
        id v21 = v25;
        _os_log_impl(&dword_1BBC44000, v20, OS_LOG_TYPE_ERROR, "[%@]: No network found at URL: %@", (uint8_t *)&v24, 0x16u);
      }
      if (a5)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v22, @"APODMLDESPluginErrorDomain", 8009, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v18 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1BBC44000, v18, OS_LOG_TYPE_ERROR, "There are no attachments.", (uint8_t *)&v24, 2u);
    }

    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v19, @"APODMLDESPluginErrorDomain", 8011, 0);
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (id)_attachmentURLWithName:(id)a3 fileName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1BBC69D04;
  v15[3] = &unk_1E624B010;
  id v7 = v6;
  id v16 = v7;
  uint64_t v9 = objc_msgSend_indexOfObjectPassingTest_(v5, v8, (uint64_t)v15);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1BBC44000, v11, OS_LOG_TYPE_ERROR, "Network not found.", v14, 2u);
    }

    v12 = 0;
  }
  else
  {
    v12 = objc_msgSend_objectAtIndexedSubscript_(v5, v10, v9);
  }

  return v12;
}

@end
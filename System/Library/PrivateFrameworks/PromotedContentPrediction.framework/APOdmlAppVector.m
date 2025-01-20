@interface APOdmlAppVector
- (APOdmlAppVector)initWithString:(id)a3 version:(id)a4;
- (APOdmlAppVector)initWithVersion:(id)a3 header:(APOdmlAppVectorHeader *)a4 floats:(float *)a5;
- (id)data;
- (id)description;
- (unint64_t)adamID;
@end

@implementation APOdmlAppVector

- (APOdmlAppVector)initWithVersion:(id)a3 header:(APOdmlAppVectorHeader *)a4 floats:(float *)a5
{
  v5 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t var2 = a4->var2;
    v13.receiver = self;
    v13.super_class = (Class)APOdmlAppVector;
    v8 = [(APOdmlVector *)&v13 initWithVersion:a3 length:var2 floats:a5];
    if (v8) {
      v8->_adamID = a4->var0;
    }
    v5 = v8;
    v9 = v5;
  }
  else
  {
    v10 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      _os_log_impl(&dword_1BBC44000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Attempt to construct APOdmlAppVector without a header.", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (APOdmlAppVector)initWithString:(id)a3 version:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v8 = a4;
  if (v6)
  {
    v9 = objc_msgSend_componentsSeparatedByString_(v6, v7, @"\t");
    v12 = objc_msgSend_firstObject(v9, v10, v11);
    unsigned int v15 = objc_msgSend_integerValue(v12, v13, v14);

    if (objc_msgSend_count(v9, v16, v17) == 2)
    {
      id v57 = v8;
      unsigned int v55 = v15;
      if (qword_1E9F8A268 != -1) {
        dispatch_once(&qword_1E9F8A268, &unk_1F14FE798);
      }
      v19 = objc_msgSend_objectAtIndex_(v9, v18, 1);
      v22 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v20, v21);
      v24 = objc_msgSend_stringByTrimmingCharactersInSet_(v19, v23, (uint64_t)v22);

      v27 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v25, v26);
      v56 = v24;
      v29 = objc_msgSend_componentsSeparatedByString_(v24, v28, @",");
      if (objc_msgSend_count(v29, v30, v31))
      {
        uint64_t v33 = 0;
        while (1)
        {
          v34 = objc_msgSend_objectAtIndex_(v29, v32, v33);
          uint64_t v36 = objc_msgSend_numberFromString_((void *)qword_1E9F8A260, v35, (uint64_t)v34);
          if (!v36) {
            break;
          }
          v39 = (void *)v36;
          v40 = objc_msgSend_numberFromString_((void *)qword_1E9F8A260, v37, (uint64_t)v34);
          objc_msgSend_addObject_(v27, v41, (uint64_t)v40);

          if (++v33 >= (unint64_t)objc_msgSend_count(v29, v42, v43)) {
            goto LABEL_9;
          }
        }
        objc_msgSend_doubleValue(v34, v37, v38);
        v51 = objc_msgSend_stringWithFormat_(NSString, v49, @"The provided string (%@) for doubleValue %.7lf at index %lu was not able to be converted to a number. Full line:\n%@", v34, v50, v33, v6);
        v52 = OdmlLogForCategory(2uLL);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v60 = (id)objc_opt_class();
          __int16 v61 = 2112;
          id v62 = v51;
          id v53 = v60;
          _os_log_impl(&dword_1BBC44000, v52, OS_LOG_TYPE_ERROR, "[%@] ERROR: %@", buf, 0x16u);
        }
        APOdmlSimulateCrash(2880291038, v51, 0);

        v45 = 0;
        id v8 = v57;
      }
      else
      {
LABEL_9:
        v58.receiver = self;
        v58.super_class = (Class)APOdmlAppVector;
        id v8 = v57;
        v44 = [(APOdmlVector *)&v58 initWithVersion:v57 andArray:v27];
        if (v44) {
          v44->_adamID = v55;
        }
        self = v44;
        v45 = self;
      }
      v47 = v56;
    }
    else
    {
      v47 = OdmlLogForCategory(2uLL);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v60 = (id)objc_opt_class();
        __int16 v61 = 2112;
        id v62 = v6;
        id v48 = v60;
        _os_log_impl(&dword_1BBC44000, v47, OS_LOG_TYPE_ERROR, "[%@]: ERROR: The line does not conform to our expectations: %@", buf, 0x16u);
      }
      v45 = 0;
    }
  }
  else
  {
    v9 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v60 = (id)objc_opt_class();
      __int16 v61 = 2112;
      id v62 = 0;
      id v46 = v60;
      _os_log_impl(&dword_1BBC44000, v9, OS_LOG_TYPE_ERROR, "[%@]: ERROR: nil datastring passed into parser: %@.", buf, 0x16u);
    }
    v45 = 0;
  }

  return v45;
}

- (id)data
{
  int v4 = objc_msgSend_length(self, a2, v2);
  id v6 = objc_msgSend_dataWithCapacity_(MEMORY[0x1E4F1CA58], v5, (4 * v4 + 16));
  int v17 = 1447253074;
  uint64_t v16 = objc_msgSend_adamID(self, v7, v8);
  int v18 = objc_msgSend_length(self, v9, v10);
  objc_msgSend_appendBytes_length_(v6, v11, (uint64_t)&v16, 16);
  v15.receiver = self;
  v15.super_class = (Class)APOdmlAppVector;
  v12 = [(APOdmlVector *)&v15 data];
  objc_msgSend_appendData_(v6, v13, (uint64_t)v12);

  return v6;
}

- (id)description
{
  v18[2] = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend_arrayOfNumbers(self, a2, v2);
  v17[0] = @"adamID";
  v5 = NSString;
  uint64_t v8 = objc_msgSend_adamID(self, v6, v7);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v5, v9, @"%llu", v8);
  v17[1] = @"vector";
  v18[0] = v10;
  v18[1] = v4;
  v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v18, v17, 2);

  objc_super v15 = objc_msgSend_description(v12, v13, v14);

  return v15;
}

- (unint64_t)adamID
{
  return self->_adamID;
}

@end
@interface SDAirDropHandlerFactory
+ (id)handlerForTransfer:(id)a3;
@end

@implementation SDAirDropHandlerFactory

+ (id)handlerForTransfer:(id)a3
{
  id v3 = a3;
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  v24[3] = objc_opt_class();
  v24[4] = objc_opt_class();
  v24[5] = objc_opt_class();
  v24[6] = objc_opt_class();
  v24[7] = objc_opt_class();
  v24[8] = objc_opt_class();
  v24[9] = objc_opt_class();
  v24[10] = objc_opt_class();
  v24[11] = objc_opt_class();
  v24[12] = objc_opt_class();
  v4 = +[NSArray arrayWithObjects:v24 count:13];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  v23[3] = objc_opt_class();
  v23[4] = objc_opt_class();
  v23[5] = objc_opt_class();
  v23[6] = objc_opt_class();
  v23[7] = objc_opt_class();
  v23[8] = objc_opt_class();
  v23[9] = objc_opt_class();
  v23[10] = objc_opt_class();
  v23[11] = objc_opt_class();
  v23[12] = objc_opt_class();
  v23[13] = objc_opt_class();
  v23[14] = objc_opt_class();
  v23[15] = objc_opt_class();
  v23[16] = objc_opt_class();
  v5 = +[NSArray arrayWithObjects:v23 count:17];
  v6 = [v4 arrayByAddingObjectsFromArray:v5];

  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v7 = +[NSArray arrayWithObjects:v22 count:2];
  v8 = [v6 arrayByAddingObjectsFromArray:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = objc_alloc(*(Class *)(*((void *)&v17 + 1) + 8 * v13));
      id v15 = [v14 initWithTransfer:v3, v17];
      if ([v15 canHandleTransfer]) {
        break;
      }

      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v15 = 0;
  }

  return v15;
}

@end
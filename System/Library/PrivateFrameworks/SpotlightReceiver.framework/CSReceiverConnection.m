@interface CSReceiverConnection
- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3;
- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5;
- (BOOL)lostClientConnection:(id)a3 error:(id)a4;
- (CSReceiverConnection)initWithReceiver:(id)a3 forServiceName:(id)a4;
- (NSArray)INIntentClassNames;
- (NSArray)bundleIDs;
- (NSArray)contentTypes;
- (SpotlightReceiver)receiver;
- (int)addInteraction:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (int)addUserActions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (int)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4;
- (int)deleteAllUserActivities:(id)a3;
- (int)deleteFromBundle:(id)a3 sinceDate:(id)a4 domains:(id)a5 deletes:(id)a6;
- (int)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (int)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (int)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4;
- (int)donateRelevantActions:(id)a3 bundleID:(id)a4;
- (int)donateRelevantShortcuts:(id)a3 bundleID:(id)a4;
- (int)handleSetup:(id)a3;
- (int)indexFromBundle:(id)a3 protectionClass:(id)a4 items:(id)a5 itemsContent:(id)a6;
- (int)purgeFromBundle:(id)a3 identifiers:(id)a4;
- (int)supportedJobs;
- (void)setBundleIDs:(id)a3;
- (void)setContentTypes:(id)a3;
- (void)setINIntentClassNames:(id)a3;
@end

@implementation CSReceiverConnection

- (int)indexFromBundle:(id)a3 protectionClass:(id)a4 items:(id)a5 itemsContent:(id)a6
{
  id v10 = a6;
  if (a5)
  {
    v11 = (objc_class *)MEMORY[0x263F02A48];
    id v12 = a5;
    id v13 = a4;
    id v14 = a3;
    id v15 = [v11 alloc];
    v16 = [v12 data];
    v17 = (void *)[v15 initWithData:v16];

    [v17 setBackingStore:v12];
    if (v10)
    {
      id v18 = objc_alloc(MEMORY[0x263F02A48]);
      v19 = [v10 data];
      v20 = (void *)[v18 initWithData:v19];

      [v20 setBackingStore:v10];
    }
    else
    {
      v20 = 0;
    }
    v21 = (void *)[objc_alloc(MEMORY[0x263F02AF0]) initWithItems:v17 itemsContent:v20];
    [v21 setBundleID:v14];
    [v21 setProtectionClass:v13];

    [(SpotlightReceiver *)self->_receiver addOrUpdateSearchableItems:v21 bundleID:v14];
  }

  return 0;
}

- (int)addInteraction:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  receiver = self->_receiver;
  id v14 = a3;
  v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 arrayWithObjects:&v14 count:1];
  -[SpotlightReceiver addInteractions:bundleID:protectionClass:](receiver, "addInteractions:bundleID:protectionClass:", v12, v10, v9, v14, v15);

  return 0;
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5
{
  uint64_t v158 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (_xpc_connection_s *)a5;
  xpc_object_t reply = xpc_dictionary_create_reply(v8);
  uid_t euid = xpc_connection_get_euid(v9);
  if (euid)
  {
    uid_t v12 = euid;
    id v13 = [(CSXPCConnection *)self queue];
    uint64_t v14 = v12;
    dispatch_queue_set_specific(v13, (const void *)SpotlightReceiverConnectionUIDKey, (void *)v12, 0);

    uint64_t v15 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v153 = a3;
      __int16 v154 = 1024;
      uid_t v155 = v12;
      __int16 v156 = 2048;
      id v157 = v8;
      _os_log_debug_impl(&dword_21B5E5000, v15, OS_LOG_TYPE_DEBUG, "receiver command %s cuid: %d info:%p", buf, 0x1Cu);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (!strcmp(a3, "s"))
  {
    int v17 = [(CSReceiverConnection *)self handleSetup:reply];
    id v18 = 0;
    v16 = 0;
LABEL_26:
    if (v14)
    {
      v31 = [(CSXPCConnection *)self queue];
      dispatch_queue_set_specific(v31, (const void *)SpotlightReceiverConnectionUIDKey, 0, 0);
    }
    xpc_dictionary_get_remote_connection(v8);
    v32 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v32 && reply)
    {
      xpc_dictionary_set_int64(reply, "status", v17);
      xpc_connection_send_message(v32, reply);
    }

    goto LABEL_32;
  }
  if (!strcmp(a3, "j"))
  {
    int64_t uint64 = xpc_dictionary_get_uint64(v8, "jt");
    if ((uint64 & self->_supportedJobs) == 0)
    {
      v23 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CSReceiverConnection handleCommand:info:connection:](uint64, &self->_supportedJobs, v23);
      }

      goto LABEL_24;
    }
    v16 = [MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v8];
    if (!v16)
    {
      v24 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[CSReceiverConnection handleCommand:info:connection:](uint64, v24, v25, v26, v27, v28, v29, v30);
      }

      goto LABEL_24;
    }
    id v18 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v8];
    if (uint64 <= 127)
    {
      if (uint64 <= 15)
      {
        int v17 = -1;
        switch(uint64)
        {
          case 0:
            goto LABEL_26;
          case 1:
            v148 = [MEMORY[0x263F02B30] dataWrapperForKey:"i" sizeKey:"i-size" fromXPCDictionary:v8];
            v20 = [MEMORY[0x263F02B30] dataWrapperForKey:"c" sizeKey:"c-size" fromXPCDictionary:v8];
            int v17 = [(CSReceiverConnection *)self indexFromBundle:v16 protectionClass:v18 items:v148 itemsContent:v20];
            id v21 = self;
            id v22 = self;

            break;
          case 2:
          case 4:
          case 8:
            goto LABEL_49;
          default:
            goto LABEL_105;
        }
        goto LABEL_26;
      }
      if (uint64 != 16)
      {
        if (uint64 != 32)
        {
          if (uint64 == 64)
          {
            v36 = [MEMORY[0x263F02B30] dataWrapperForKey:"a" sizeKey:"a-size" fromXPCDictionary:v8];
            if (v36)
            {
              int v17 = [(CSReceiverConnection *)self addUserActions:v36 bundleID:v16 protectionClass:v18];
              id v38 = self;
              goto LABEL_136;
            }
            v113 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
              -[CSReceiverConnection handleCommand:info:connection:].cold.8(v113, v114, v115, v116, v117, v118, v119, v120);
            }
            goto LABEL_135;
          }
          goto LABEL_105;
        }
        v56 = [MEMORY[0x263F02B30] dataWrapperForKey:"ids" sizeKey:"ids-size" fromXPCDictionary:v8];
        if (v56)
        {
          id v57 = objc_alloc(MEMORY[0x263F02A48]);
          v58 = [v56 data];
          v59 = (void *)[v57 initWithData:v58];

          if (v59
            && ([v59 obj], _MDPlistGetPlistObjectType() == 240)
            && ([v59 obj], _MDPlistArrayGetCount()))
          {
            [v59 obj];
            v60 = _MDPlistContainerCopyObject();

            if (v60)
            {
              int v17 = [(CSReceiverConnection *)self purgeFromBundle:v16 identifiers:v60];
              goto LABEL_150;
            }
          }
          else
          {
          }
        }
        v60 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          -[CSReceiverConnection handleCommand:info:connection:].cold.7(v60, v92, v93, v94, v95, v96, v97, v98);
        }
        int v17 = -1;
        goto LABEL_150;
      }
LABEL_49:
      v149 = [MEMORY[0x263F02B30] dataWrapperForKey:"ids" sizeKey:"ids-size" fromXPCDictionary:v8];
      if (uint64 != 16)
      {
        if (uint64 != 4)
        {
          if (uint64 != 2)
          {
            uint64_t v44 = 0;
            v43 = 0;
            goto LABEL_80;
          }
          if (v149)
          {
            id v39 = objc_alloc(MEMORY[0x263F02A48]);
            v40 = [v149 data];
            v41 = (void *)[v39 initWithData:v40];

            if (v41
              && ([v41 obj], _MDPlistGetPlistObjectType() == 240)
              && ([v41 obj], _MDPlistArrayGetCount()))
            {
              [v41 obj];
              uint64_t v42 = _MDPlistContainerCopyObject();

              if (v42)
              {
                v43 = (void *)v42;
                uint64_t v44 = 0;
LABEL_80:
                v51 = 0;
                goto LABEL_81;
              }
            }
            else
            {
            }
          }
          v77 = logForCSLogCategoryDefault();
          v55 = v77;
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            -[CSReceiverConnection handleCommand:info:connection:].cold.4(v77, v85, v86, v87, v88, v89, v90, v91);
            goto LABEL_124;
          }
          goto LABEL_125;
        }
        if (v149)
        {
          id v48 = objc_alloc(MEMORY[0x263F02A48]);
          v49 = [v149 data];
          v50 = (void *)[v48 initWithData:v49];

          if (v50
            && ([v50 obj], _MDPlistGetPlistObjectType() == 240)
            && ([v50 obj], _MDPlistArrayGetCount()))
          {
            [v50 obj];
            v51 = (void *)_MDPlistContainerCopyObject();

            if (v51)
            {
              uint64_t v44 = 0;
              v43 = 0;
              goto LABEL_81;
            }
          }
          else
          {
          }
        }
        v77 = logForCSLogCategoryDefault();
        v55 = v77;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          -[CSReceiverConnection handleCommand:info:connection:].cold.5(v77, v78, v79, v80, v81, v82, v83, v84);
LABEL_124:
          int v17 = -1;
          v55 = v77;
          goto LABEL_126;
        }
LABEL_125:
        int v17 = -1;
        goto LABEL_126;
      }
      int64_t date = xpc_dictionary_get_date(v8, "d");
      if (!date)
      {
        v77 = logForCSLogCategoryDefault();
        v55 = v77;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          -[CSReceiverConnection handleCommand:info:connection:].cold.6(v77, v106, v107, v108, v109, v110, v111, v112);
          goto LABEL_124;
        }
        goto LABEL_125;
      }
      uint64_t v53 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)date];
      v43 = 0;
      v51 = 0;
      uint64_t v44 = v53;
LABEL_81:
      v145 = v44;
      v54 = v43;
      int v17 = -[CSReceiverConnection deleteFromBundle:sinceDate:domains:deletes:](self, "deleteFromBundle:sinceDate:domains:deletes:", v16);

      v55 = v145;
LABEL_126:

      goto LABEL_26;
    }
    if (uint64 <= 2047)
    {
      if (uint64 <= 511)
      {
        if (uint64 != 128)
        {
          if (uint64 == 256)
          {
            v34 = (void *)MEMORY[0x263F02B30];
            v35 = xpc_dictionary_get_value(v8, "ids");
            v36 = (void *)[v34 copyNSStringArrayFromXPCArray:v35];

            if (v36)
            {
              int v17 = [(CSReceiverConnection *)self deleteInteractionsWithIdentifiers:v36 bundleID:v16 protectionClass:v18];
LABEL_136:

              goto LABEL_26;
            }
            v113 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
              -[CSReceiverConnection handleCommand:info:connection:]2(v113, v121, v122, v123, v124, v125, v126, v127);
            }
LABEL_135:

            int v17 = -1;
            goto LABEL_136;
          }
LABEL_105:
          v70 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
            -[CSReceiverConnection handleCommand:info:connection:](uint64, v70, v71, v72, v73, v74, v75, v76);
          }

          goto LABEL_25;
        }
        v56 = [MEMORY[0x263F02B30] dataWrapperForKey:"ins" sizeKey:"ins-size" fromXPCDictionary:v8];
        if (!v56) {
          goto LABEL_147;
        }
        id v61 = objc_alloc(MEMORY[0x263F08928]);
        v62 = [v56 data];
        v151 = (void *)[v61 initForReadingFromData:v62 error:0];

        v63 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
        v60 = [v151 decodeObjectOfClasses:v63 forKey:*MEMORY[0x263F081D0]];

        if (v60)
        {
          int v17 = [(CSReceiverConnection *)self addInteraction:v60 bundleID:v16 protectionClass:v18];
        }
        else
        {
LABEL_147:
          v60 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            -[CSReceiverConnection handleCommand:info:connection:]0();
          }
          int v17 = -1;
        }
LABEL_150:

        goto LABEL_26;
      }
      if (uint64 == 512)
      {
        v65 = (void *)MEMORY[0x263F02B30];
        v66 = xpc_dictionary_get_value(v8, "ids");
        v36 = (void *)[v65 copyNSStringArrayFromXPCArray:v66];

        if (v36)
        {
          int v17 = [(CSReceiverConnection *)self deleteInteractionsWithGroupIdentifiers:v36 bundleID:v16 protectionClass:v18];
          goto LABEL_136;
        }
        v113 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
          -[CSReceiverConnection handleCommand:info:connection:]3(v113, v128, v129, v130, v131, v132, v133, v134);
        }
        goto LABEL_135;
      }
      if (uint64 != 1024) {
        goto LABEL_105;
      }
      int v37 = [(CSReceiverConnection *)self deleteAllInteractionsWithBundleID:v16 protectionClass:v18];
LABEL_61:
      int v17 = v37;
      goto LABEL_26;
    }
    if (uint64 < 0x2000)
    {
      if (uint64 != 2048)
      {
        if (uint64 != 4096) {
          goto LABEL_105;
        }
        int v37 = [(CSReceiverConnection *)self deleteAllUserActivities:v16];
        goto LABEL_61;
      }
      uint64_t v64 = xpc_dictionary_get_value(v8, "ra");
      v46 = (void *)v64;
      if (v64
        && MEMORY[0x21D491870](v64) == MEMORY[0x263EF86F8]
        && (size_t length = xpc_data_get_length(v46)) != 0
        && (bytes_ptr = xpc_data_get_bytes_ptr(v46)) != 0
        && ([MEMORY[0x263EFF8F8] dataWithBytesNoCopy:bytes_ptr length:length freeWhenDone:0],
            (v150 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v147 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v150 error:0];
        v142 = (void *)MEMORY[0x263EFFA08];
        uint64_t v143 = objc_opt_class();
        v144 = objc_msgSend(v142, "setWithObjects:", v143, objc_opt_class(), 0);
        v47 = [v147 decodeObjectOfClasses:v144 forKey:*MEMORY[0x263F081D0]];

        if (v47)
        {
          int v17 = [(CSReceiverConnection *)self donateRelevantShortcuts:v47 bundleID:v16];
          goto LABEL_70;
        }
      }
      else
      {
        v150 = 0;
      }
      v47 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[CSReceiverConnection handleCommand:info:connection:]4();
      }
      int v17 = -1;
      goto LABEL_70;
    }
    if (uint64 == 0x2000)
    {
      v56 = [MEMORY[0x263F02B30] dataWrapperForKey:"ids" sizeKey:"ids-size" fromXPCDictionary:v8];
      if (v56)
      {
        id v67 = objc_alloc(MEMORY[0x263F02A48]);
        v68 = [v56 data];
        v69 = (void *)[v67 initWithData:v68];

        if (v69
          && ([v69 obj], _MDPlistGetPlistObjectType() == 240)
          && ([v69 obj], _MDPlistArrayGetCount()))
        {
          [v69 obj];
          v60 = _MDPlistContainerCopyObject();

          if (v60)
          {
            int v17 = [(CSReceiverConnection *)self deleteUserActivitiesWithPersistentIdentifiers:v60 bundleID:v16];
            goto LABEL_150;
          }
        }
        else
        {
        }
      }
      v60 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        -[CSReceiverConnection handleCommand:info:connection:].cold.9(v60, v99, v100, v101, v102, v103, v104, v105);
      }
      int v17 = -1;
      goto LABEL_150;
    }
    if (uint64 != 0x4000) {
      goto LABEL_105;
    }
    uint64_t v45 = xpc_dictionary_get_value(v8, "ra");
    v46 = (void *)v45;
    if (v45
      && MEMORY[0x21D491870](v45) == MEMORY[0x263EF86F8]
      && (size_t v135 = xpc_data_get_length(v46)) != 0
      && (v136 = xpc_data_get_bytes_ptr(v46)) != 0
      && ([MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v136 length:v135 freeWhenDone:0],
          (v150 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v146 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v150 error:0];
      v137 = (void *)MEMORY[0x263EFFA08];
      uint64_t v138 = objc_opt_class();
      v139 = objc_msgSend(v137, "setWithObjects:", v138, objc_opt_class(), 0);
      v47 = [v146 decodeObjectOfClasses:v139 forKey:*MEMORY[0x263F081D0]];

      if (v47)
      {
        int v17 = [(CSReceiverConnection *)self donateRelevantActions:v47 bundleID:v16];
LABEL_70:

        goto LABEL_26;
      }
    }
    else
    {
      v150 = 0;
    }
    v47 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      -[CSReceiverConnection handleCommand:info:connection:]6();
    }
    int v17 = -1;
    goto LABEL_70;
  }
  if (!_SpotlightDaemonClientHandleCommand(a3, v8, self->_receiver))
  {
LABEL_24:
    id v18 = 0;
    v16 = 0;
LABEL_25:
    int v17 = -1;
    goto LABEL_26;
  }
  if (v14)
  {
    v16 = [(CSXPCConnection *)self queue];
    dispatch_queue_set_specific(v16, (const void *)SpotlightReceiverConnectionUIDKey, 0, 0);
LABEL_32:
  }
  return 1;
}

- (int)deleteFromBundle:(id)a3 sinceDate:(id)a4 domains:(id)a5 deletes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    [(SpotlightReceiver *)self->_receiver deleteSearchableItemsWithIdentifiers:v13 bundleID:v10];
  }
  else if (v12)
  {
    [(SpotlightReceiver *)self->_receiver deleteSearchableItemsWithDomainIdentifiers:v12 bundleID:v10];
  }
  else
  {
    receiver = self->_receiver;
    if (v11) {
      [(SpotlightReceiver *)receiver deleteSearchableItemsSinceDate:v11 bundleID:v10];
    }
    else {
      [(SpotlightReceiver *)receiver deleteAllSearchableItemsWithBundleID:v10];
    }
  }

  return 0;
}

- (CSReceiverConnection)initWithReceiver:(id)a3 forServiceName:(id)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSReceiverConnection;
  id v8 = [(CSXPCConnection *)&v15 initMachServiceListenerWithName:a4];
  id v9 = (CSReceiverConnection *)v8;
  if (!v8) {
    goto LABEL_39;
  }
  id v10 = v8 + 8;
  objc_storeStrong(v8 + 8, a3);
  if (objc_opt_respondsToSelector())
  {
    id v11 = [*v10 supportedBundleIDs];
    [(CSReceiverConnection *)v9 setBundleIDs:v11];
  }
  if (objc_opt_respondsToSelector())
  {
    id v12 = [*v10 supportedContentTypes];
    [(CSReceiverConnection *)v9 setContentTypes:v12];
  }
  if (objc_opt_respondsToSelector()) {
    v9->_supportedJobs |= 1u;
  }
  if (objc_opt_respondsToSelector()) {
    v9->_supportedJobs |= 2u;
  }
  if (objc_opt_respondsToSelector()) {
    v9->_supportedJobs |= 4u;
  }
  if (objc_opt_respondsToSelector()) {
    v9->_supportedJobs |= 8u;
  }
  if (objc_opt_respondsToSelector()) {
    v9->_supportedJobs |= 0x10u;
  }
  if (objc_opt_respondsToSelector()) {
    v9->_supportedJobs |= 0x20u;
  }
  if (objc_opt_respondsToSelector()) {
    v9->_supportedJobs |= 0x40u;
  }
  if (objc_opt_respondsToSelector()) {
    v9->_supportedJobs |= 0x1000u;
  }
  if (objc_opt_respondsToSelector()) {
    v9->_supportedJobs |= 0x2000u;
  }
  if (objc_opt_respondsToSelector()) {
    v9->_supportedJobs |= 0x80u;
  }
  if (objc_opt_respondsToSelector()) {
    v9->_supportedJobs |= 0x100u;
  }
  if (objc_opt_respondsToSelector()) {
    v9->_supportedJobs |= 0x200u;
  }
  if (objc_opt_respondsToSelector()) {
    v9->_supportedJobs |= 0x400u;
  }
  if (objc_opt_respondsToSelector())
  {
    int v13 = 2048;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_37;
    }
    int v13 = 0x4000;
  }
  v9->_supportedJobs |= v13;
LABEL_37:
  if ([*v10 conformsToProtocol:&unk_26CB6B920]) {
    v9->_supportedJobs |= 0x8000u;
  }
LABEL_39:

  return v9;
}

- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = (_xpc_connection_s *)a3;
  uint64_t pid = xpc_connection_get_pid(v3);
  xpc_connection_get_audit_token();

  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  memset(&token, 0, sizeof(token));
  v6 = SecTaskCreateWithAuditToken(v5, &token);
  if (v6)
  {
    id v7 = v6;
    id v8 = (void *)SecTaskCopyValueForEntitlement(v6, (CFStringRef)SpotlightSenderEntitlement, 0);
    int v9 = [v8 BOOLValue];
    id v10 = logForCSLogCategoryDefault();
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        token.val[0] = 67109120;
        token.val[1] = pid;
        _os_log_impl(&dword_21B5E5000, v11, OS_LOG_TYPE_INFO, "New sender connection for pid: %d", (uint8_t *)&token, 8u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[CSReceiverConnection addClientConnectionIfAllowedForConnection:](pid, v11, v12, v13, v14, v15, v16, v17);
    }

    CFRelease(v7);
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)lostClientConnection:(id)a3 error:(id)a4
{
  return 0;
}

- (int)handleSetup:(id)a3
{
  id v4 = a3;
  xpc_dictionary_set_uint64(v4, "jt", self->_supportedJobs);
  bundleIDs = self->_bundleIDs;
  if (bundleIDs) {
    [MEMORY[0x263F02B30] dictionary:v4 setStringArray:bundleIDs forKey:"bids"];
  }
  contentTypes = self->_contentTypes;
  if (contentTypes) {
    [MEMORY[0x263F02B30] dictionary:v4 setStringArray:contentTypes forKey:"cts"];
  }
  INIntentClassNames = self->_INIntentClassNames;
  if (INIntentClassNames) {
    [MEMORY[0x263F02B30] dictionary:v4 setStringArray:INIntentClassNames forKey:"icls"];
  }

  return 0;
}

- (int)purgeFromBundle:(id)a3 identifiers:(id)a4
{
  return 0;
}

- (int)addUserActions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  int v9 = (objc_class *)MEMORY[0x263F02A48];
  id v10 = a3;
  id v11 = [v9 alloc];
  uint64_t v12 = [v10 data];
  uint64_t v13 = (void *)[v11 initWithData:v12];

  [v13 setBackingStore:v10];
  if (v13)
  {
    [v13 obj];
    if (_MDPlistGetPlistObjectType() == 240)
    {
      [v13 obj];
      if (_MDPlistArrayGetCount())
      {
        [v13 obj];
        id v15 = v13;
        id v16 = v7;
        id v17 = v8;
        _MDPlistArrayIterate();
      }
    }
  }

  return 0;
}

void __64__CSReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke(void *a1, long long *a2)
{
  long long v12 = *a2;
  uint64_t v13 = *((void *)a2 + 2);
  if (_MDPlistGetPlistObjectType() == 240)
  {
    long long v12 = *a2;
    uint64_t v13 = *((void *)a2 + 2);
    if (_MDPlistArrayGetCount() == 2)
    {
      id v4 = (void *)a1[4];
      long long v12 = *a2;
      uint64_t v13 = *((void *)a2 + 2);
      _MDPlistArrayGetPlistObjectAtIndex();
      CFAllocatorRef v5 = [v4 decodeObject:v11];
      v6 = (void *)a1[4];
      long long v12 = *a2;
      uint64_t v13 = *((void *)a2 + 2);
      _MDPlistArrayGetPlistObjectAtIndex();
      id v7 = [v6 decodeObject:&v10];
      id v8 = objc_alloc_init(MEMORY[0x263F02AE0]);
      [v8 setAttributeSet:v7];
      [v8 setBundleID:a1[5]];
      [v8 setProtection:a1[6]];
      int v9 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __64__CSReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke_cold_1((uint64_t)v5, v9);
      }

      [*(id *)(a1[7] + 64) addUserAction:v5 withItem:v8];
    }
  }
}

- (int)deleteAllUserActivities:(id)a3
{
  return 0;
}

- (int)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4
{
  return 0;
}

- (int)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  return 0;
}

- (int)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  return 0;
}

- (int)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4
{
  return 0;
}

- (int)donateRelevantShortcuts:(id)a3 bundleID:(id)a4
{
  return 0;
}

- (int)donateRelevantActions:(id)a3 bundleID:(id)a4
{
  return 0;
}

- (int)supportedJobs
{
  return self->_supportedJobs;
}

- (SpotlightReceiver)receiver
{
  return self->_receiver;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
}

- (NSArray)contentTypes
{
  return self->_contentTypes;
}

- (void)setContentTypes:(id)a3
{
}

- (NSArray)INIntentClassNames
{
  return self->_INIntentClassNames;
}

- (void)setINIntentClassNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_INIntentClassNames, 0);
  objc_storeStrong((id *)&self->_contentTypes, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
}

- (void)addClientConnectionIfAllowedForConnection:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleCommand:(int)a1 info:(int *)a2 connection:(os_log_t)log .cold.1(int a1, int *a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *a2;
  v4[0] = 67109376;
  v4[1] = a1;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl(&dword_21B5E5000, log, OS_LOG_TYPE_ERROR, "Job not supported type: 0x%x supported: 0x%x ", (uint8_t *)v4, 0xEu);
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleCommand:info:connection:.cold.10()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21B5E5000, v0, v1, "missing interactions for jobType: 0x%x error:%@", v2, v3, v4, v5, 2u);
}

- (void)handleCommand:(void *)a1 info:(uint64_t)a2 connection:(NSObject *)a3 .cold.11(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2(&dword_21B5E5000, a2, a3, "Error: %@", (uint8_t *)a2);
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleCommand:(uint64_t)a3 info:(uint64_t)a4 connection:(uint64_t)a5 .cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleCommand:info:connection:.cold.14()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21B5E5000, v0, v1, "missing INRelevantShortcuts for jobType: 0x%x error:%@", v2, v3, v4, v5, 2u);
}

- (void)handleCommand:info:connection:.cold.16()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21B5E5000, v0, v1, "missing relevantActions for jobType: 0x%x error:%@", v2, v3, v4, v5, 2u);
}

void __64__CSReceiverConnection_addUserActions_bundleID_protectionClass___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21B5E5000, a2, OS_LOG_TYPE_DEBUG, "addUserAction: %@", (uint8_t *)&v2, 0xCu);
}

@end
@interface _SCRCThreadTask
+ (id)newThreadTaskWithTarget:(id)a3 selector:(SEL)a4 cancelMask:(unsigned int)a5 count:(unsigned int)a6 firstObject:(id)a7 moreObjects:(char *)a8;
- (_SCRCThreadTask)initWithTarget:(id)a3 selector:(SEL)a4 cancelMask:(unsigned int)a5 count:(unsigned int)a6 firstObject:(id)a7 moreObjects:(char *)a8;
- (void)dealloc;
- (void)fire;
- (void)setWaitLock:(id)a3;
@end

@implementation _SCRCThreadTask

+ (id)newThreadTaskWithTarget:(id)a3 selector:(SEL)a4 cancelMask:(unsigned int)a5 count:(unsigned int)a6 firstObject:(id)a7 moreObjects:(char *)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  id v13 = a7;
  id v14 = a3;
  v15 = [[_SCRCThreadTask alloc] initWithTarget:v14 selector:a4 cancelMask:v10 count:v9 firstObject:v13 moreObjects:a8];

  return v15;
}

- (_SCRCThreadTask)initWithTarget:(id)a3 selector:(SEL)a4 cancelMask:(unsigned int)a5 count:(unsigned int)a6 firstObject:(id)a7 moreObjects:(char *)a8
{
  id v15 = a3;
  id v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)_SCRCThreadTask;
  v33 = a8;
  v17 = [(_SCRCThreadTask *)&v32 init];
  v18 = v17;
  if (a6 < 9)
  {
    if (v17)
    {
      objc_storeStrong(&v17->_target, a3);
      SEL v19 = a4 ? a4 : 0;
      v18->_selector = v19;
      v18->_mask = a5;
      uint64_t v20 = [MEMORY[0x263EFF980] arrayWithCapacity:a6];
      objectArray = v18->_objectArray;
      v18->_objectArray = (NSMutableArray *)v20;

      if (a6)
      {
        v22 = v18->_objectArray;
        if (v16)
        {
          [(NSMutableArray *)v18->_objectArray addObject:v16];
        }
        else
        {
          v23 = [MEMORY[0x263EFF9D0] null];
          [(NSMutableArray *)v22 addObject:v23];
        }
        if (a6 >= 2)
        {
          unsigned int v24 = a6 - 1;
          do
          {
            v25 = (void **)v33;
            v33 += 8;
            v26 = *v25;
            v27 = v18->_objectArray;
            if (*v25)
            {
              [(NSMutableArray *)v27 addObject:v26];
            }
            else
            {
              v28 = (void *)MEMORY[0x263EFF9D0];
              id v29 = 0;
              v30 = [v28 null];
              [(NSMutableArray *)v27 addObject:v30];
            }
            --v24;
          }
          while (v24);
        }
      }
    }
  }
  else
  {

    v18 = 0;
  }

  return v18;
}

- (void)dealloc
{
  waitLock = self->_waitLock;
  if (waitLock) {
    [(NSConditionLock *)waitLock unlockWithCondition:1];
  }
  v4.receiver = self;
  v4.super_class = (Class)_SCRCThreadTask;
  [(_SCRCThreadTask *)&v4 dealloc];
}

- (void)setWaitLock:(id)a3
{
  v5 = (NSConditionLock *)a3;
  waitLock = self->_waitLock;
  p_waitLock = &self->_waitLock;
  v6 = waitLock;
  if (waitLock != v5)
  {
    if (v6) {
      [(NSConditionLock *)v6 unlockWithCondition:1];
    }
    objc_storeStrong((id *)p_waitLock, a3);
  }
  MEMORY[0x270F9A758]();
}

- (void)fire
{
  if (self->_target && self->_selector)
  {
    v133 = (void *)MEMORY[0x21D4A05A0]();
    switch([(NSMutableArray *)self->_objectArray count])
    {
      case 0:
        id target = self->_target;
        selector = self->_selector;
        if (selector) {
          id v5 = [target selector];
        }
        else {
          id v5 = [target 0];
        }
        id v15 = v5;
        goto LABEL_219;
      case 1:
        id v8 = self->_target;
        if (self->_selector) {
          uint64_t v9 = self->_selector;
        }
        else {
          uint64_t v9 = 0;
        }
        id v16 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        v17 = [MEMORY[0x263EFF9D0] null];
        if (v16 == v17)
        {
          v18 = 0;
        }
        else
        {
          v18 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        }
        id v27 = objc_msgSend(v8, v9, v18);
        if (v16 != v17) {

        }
        goto LABEL_219;
      case 2:
        id v6 = self->_target;
        if (self->_selector) {
          v7 = self->_selector;
        }
        else {
          v7 = 0;
        }
        v11 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        v12 = [MEMORY[0x263EFF9D0] null];
        if (v11 == v12)
        {
          id v13 = 0;
        }
        else
        {
          id v13 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        }
        v21 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        v22 = [MEMORY[0x263EFF9D0] null];
        if (v21 == v22)
        {
          v23 = 0;
        }
        else
        {
          v23 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        }
        id v32 = objc_msgSend(v6, v7, v13, v23);
        if (v21 != v22) {

        }
        if (v11 != v12) {
        goto LABEL_107;
        }
      case 3:
        id v131 = self->_target;
        if (self->_selector) {
          v128 = self->_selector;
        }
        else {
          v128 = 0;
        }
        v11 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        v12 = [MEMORY[0x263EFF9D0] null];
        if (v11 == v12)
        {
          id v14 = 0;
        }
        else
        {
          id v14 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        }
        unsigned int v24 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        v25 = [MEMORY[0x263EFF9D0] null];
        if (v24 == v25)
        {
          v26 = 0;
        }
        else
        {
          v26 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        }
        v33 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:2];
        v34 = [MEMORY[0x263EFF9D0] null];
        if (v33 == v34)
        {
          v35 = 0;
        }
        else
        {
          v35 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:2];
        }
        id v42 = objc_msgSend(v131, v128, v14, v26, v35);
        if (v33 != v34) {

        }
        if (v24 != v25) {
        if (v11 != v12)
        }

LABEL_107:
        goto LABEL_219;
      case 4:
        id v118 = self->_target;
        if (self->_selector) {
          v113 = self->_selector;
        }
        else {
          v113 = 0;
        }
        v132 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        uint64_t v10 = [MEMORY[0x263EFF9D0] null];
        if (v132 == v10)
        {
          v129 = 0;
        }
        else
        {
          v129 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        }
        SEL v19 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        uint64_t v20 = [MEMORY[0x263EFF9D0] null];
        if (v19 == v20)
        {
          v123 = 0;
        }
        else
        {
          v123 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        }
        id v29 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:2];
        v30 = [MEMORY[0x263EFF9D0] null];
        if (v29 == v30)
        {
          v31 = 0;
        }
        else
        {
          v31 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:2];
        }
        v39 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:3];
        v40 = [MEMORY[0x263EFF9D0] null];
        if (v39 == v40)
        {
          v41 = 0;
        }
        else
        {
          v41 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:3];
        }
        id v49 = objc_msgSend(v118, v113, v129, v123, v31, v41);
        if (v39 != v40) {

        }
        if (v29 != v30) {
        if (v19 != v20)
        }

        if (v132 != v10) {
        goto LABEL_218;
        }
      case 5:
        id v105 = self->_target;
        if (self->_selector) {
          v101 = self->_selector;
        }
        else {
          v101 = 0;
        }
        v132 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        v130 = [MEMORY[0x263EFF9D0] null];
        if (v132 == v130)
        {
          uint64_t v119 = 0;
        }
        else
        {
          uint64_t v119 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        }
        v125 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        v28 = [MEMORY[0x263EFF9D0] null];
        if (v125 == v28)
        {
          v114 = 0;
        }
        else
        {
          v114 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        }
        v36 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:2];
        v37 = [MEMORY[0x263EFF9D0] null];
        if (v36 == v37)
        {
          v111 = 0;
        }
        else
        {
          v111 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:2];
        }
        v44 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:3];
        v45 = [MEMORY[0x263EFF9D0] null];
        if (v44 == v45)
        {
          v46 = 0;
        }
        else
        {
          v46 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:3];
        }
        v52 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:4];
        v53 = [MEMORY[0x263EFF9D0] null];
        if (v52 == v53)
        {
          v54 = 0;
        }
        else
        {
          v54 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:4];
        }
        id v62 = objc_msgSend(v105, v101, v119, v114, v111, v46, v54);
        if (v52 != v53) {

        }
        if (v44 != v45) {
        if (v36 != v37)
        }

        if (v125 != v28) {
        if (v132 == v130)
        }
          goto LABEL_217;
        v63 = (void *)v119;
        break;
      case 6:
        id v92 = self->_target;
        if (self->_selector) {
          v95 = self->_selector;
        }
        else {
          v95 = 0;
        }
        v132 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        v130 = [MEMORY[0x263EFF9D0] null];
        if (v132 == v130)
        {
          uint64_t v109 = 0;
        }
        else
        {
          uint64_t v109 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        }
        v126 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        v121 = [MEMORY[0x263EFF9D0] null];
        if (v126 == v121)
        {
          v106 = 0;
        }
        else
        {
          v106 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        }
        v116 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:2];
        v38 = [MEMORY[0x263EFF9D0] null];
        if (v116 == v38)
        {
          v103 = 0;
        }
        else
        {
          v103 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:2];
        }
        v47 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:3];
        v48 = [MEMORY[0x263EFF9D0] null];
        if (v47 == v48)
        {
          v99 = 0;
        }
        else
        {
          v99 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:3];
        }
        v55 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:4];
        v56 = [MEMORY[0x263EFF9D0] null];
        if (v55 == v56)
        {
          v57 = 0;
        }
        else
        {
          v57 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:4];
        }
        v64 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:5];
        v65 = [MEMORY[0x263EFF9D0] null];
        if (v64 == v65)
        {
          v66 = 0;
        }
        else
        {
          v66 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:5];
        }
        id v72 = objc_msgSend(v92, v95, v109, v106, v103, v99, v57, v66);
        if (v64 != v65) {

        }
        if (v55 != v56) {
        if (v47 != v48)
        }

        if (v116 != v38) {
        if (v126 != v121)
        }

        if (v132 == v130) {
          goto LABEL_217;
        }
        v63 = (void *)v109;
        break;
      case 7:
        id v88 = self->_target;
        if (self->_selector) {
          v86 = self->_selector;
        }
        else {
          v86 = 0;
        }
        v132 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        v130 = [MEMORY[0x263EFF9D0] null];
        if (v132 == v130)
        {
          uint64_t v102 = 0;
        }
        else
        {
          uint64_t v102 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        }
        v124 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        v120 = [MEMORY[0x263EFF9D0] null];
        if (v124 == v120)
        {
          v98 = 0;
        }
        else
        {
          v98 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        }
        v115 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:2];
        v110 = [MEMORY[0x263EFF9D0] null];
        if (v115 == v110)
        {
          v97 = 0;
        }
        else
        {
          v97 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:2];
        }
        v107 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:3];
        v43 = [MEMORY[0x263EFF9D0] null];
        if (v107 == v43)
        {
          v94 = 0;
        }
        else
        {
          v94 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:3];
        }
        v50 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:4];
        v51 = [MEMORY[0x263EFF9D0] null];
        if (v50 == v51)
        {
          v91 = 0;
        }
        else
        {
          v91 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:4];
        }
        v59 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:5];
        v60 = [MEMORY[0x263EFF9D0] null];
        if (v59 == v60)
        {
          v61 = 0;
        }
        else
        {
          v61 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:5];
        }
        v69 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:6];
        v70 = [MEMORY[0x263EFF9D0] null];
        if (v69 == v70)
        {
          v71 = 0;
        }
        else
        {
          v71 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:6];
        }
        id v76 = objc_msgSend(v88, v86, v102, v98, v97, v94, v91, v61, v71);
        if (v69 != v70) {

        }
        if (v59 != v60) {
        if (v50 != v51)
        }

        if (v107 != v43) {
        if (v115 != v110)
        }

        if (v124 != v120) {
        if (v132 == v130)
        }
          goto LABEL_217;
        v63 = (void *)v102;
        break;
      case 8:
        id v84 = self->_target;
        if (self->_selector) {
          v83 = self->_selector;
        }
        else {
          v83 = 0;
        }
        v132 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        v130 = [MEMORY[0x263EFF9D0] null];
        if (v132 == v130)
        {
          uint64_t v96 = 0;
        }
        else
        {
          uint64_t v96 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:0];
        }
        v127 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        v122 = [MEMORY[0x263EFF9D0] null];
        if (v127 == v122)
        {
          v93 = 0;
        }
        else
        {
          v93 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:1];
        }
        v117 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:2];
        v112 = [MEMORY[0x263EFF9D0] null];
        if (v117 == v112)
        {
          v90 = 0;
        }
        else
        {
          v90 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:2];
        }
        v108 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:3];
        v104 = [MEMORY[0x263EFF9D0] null];
        if (v108 == v104)
        {
          v89 = 0;
        }
        else
        {
          v89 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:3];
        }
        v100 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:4];
        v58 = [MEMORY[0x263EFF9D0] null];
        if (v100 == v58)
        {
          v87 = 0;
        }
        else
        {
          v87 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:4];
        }
        v67 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:5];
        v68 = [MEMORY[0x263EFF9D0] null];
        if (v67 == v68)
        {
          v85 = 0;
        }
        else
        {
          v85 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:5];
        }
        v73 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:6];
        v74 = [MEMORY[0x263EFF9D0] null];
        if (v73 == v74)
        {
          v75 = 0;
        }
        else
        {
          v75 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:6];
        }
        v77 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:7];
        v78 = [MEMORY[0x263EFF9D0] null];
        if (v77 == v78)
        {
          v79 = 0;
        }
        else
        {
          v79 = [(NSMutableArray *)self->_objectArray objectAtIndexedSubscript:7];
        }
        id v80 = objc_msgSend(v84, v83, v96, v93, v90, v89, v87, v85, v75, v79);
        if (v77 != v78) {

        }
        if (v73 != v74) {
        if (v67 != v68)
        }

        if (v100 != v58) {
        if (v108 != v104)
        }

        if (v117 != v112) {
        if (v127 != v122)
        }

        if (v132 == v130) {
          goto LABEL_217;
        }
        v63 = (void *)v96;
        break;
      default:
        goto LABEL_219;
    }

LABEL_217:
LABEL_218:

LABEL_219:
    waitLock = self->_waitLock;
    if (waitLock)
    {
      [(NSConditionLock *)waitLock lock];
      [(NSConditionLock *)self->_waitLock unlockWithCondition:1];
      v82 = self->_waitLock;
      self->_waitLock = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectArray, 0);
  objc_storeStrong((id *)&self->_waitLock, 0);
  objc_storeStrong(&self->_target, 0);
}

@end